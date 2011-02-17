;;; 20_flymake.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/01/23


(require 'flymake)


;; face設定
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")


;; flymakeのエラーをミニバッファに表示
;; http://d.hatena.ne.jp/khiker/20070720/emacs_flymake
(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))


;; 一時ファイルを用いる場合の雛形マクロ
(defmacro def-flymake-file-init (funcname args &rest body)
  `(defun ,funcname ()
     (let* ((temp-file (flymake-init-create-temp-buffer-copy
                        'flymake-create-temp-inplace))
            (,(car args) (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
       ,@body)))


;; C設定
(def-flymake-file-init flymake-c-init (file)
  (list "gcc" (list "-std=c99" "-Wall" "-Wextra" "-pedantic" "-fsyntax-only" file)))

(push '("\\.[cC]\\'" flymake-c-init) flymake-allowed-file-name-masks)


;; C++設定
(def-flymake-file-init flymake-c++-init (file)
  (list "g++" (list "-std=c++0x" "-Wall" "-Wextra" "-pedantic" "-fsyntax-only" file)))

(push '("\\.c\\(pp\\|xx\\|c\\)\\'" flymake-c++-init)
      flymake-allowed-file-name-masks)


;; Ruby設定
(def-flymake-file-init flymake-ruby-init (file)
  (list "ruby" (list "-c" file)))

(push '("\\.rb\\'" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile\\'" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


;; Emacs Lisp
(def-flymake-file-init flymake-elisp-init (file)
  (list "elisplint" (list file)))

(push '("\\.el\\'" flymake-elisp-init) flymake-allowed-file-name-masks)


;; LaTeX
(def-flymake-file-init flymake-LaTeX-init (file)
  (list "chktex-jp" (list file)))

(push '("\\.tex$" flymake-LaTeX-init) flymake-allowed-file-name-masks)
(push '("^\\(\.+\.tex\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)" nil 2 3 4) flymake-err-line-patterns)


;; Makefile
(def-flymake-file-init flymake-makefile-init (file)
  (list "make" (list "-n" "-s" file)))

(push '("Makefile\\'" flymake-makefile-init) flymake-allowed-file-name-masks)
(push '("\\.mak\\'" flymake-makefile-init) flymake-allowed-file-name-masks)


;; shell script
(def-flymake-file-init flymake-shell-init (file)
  (list "/bin/bash" (list "-n" file)))

(push '("\\.sh\\'" flymake-shell-init) flymake-allowed-file-name-masks)


;; EOF
