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
(defun jiros-flymake-file-init (cmd &optional opts)
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))


;; Makefileがあれば使い、なければ一時ファイルを使う
(defun jiros-flymake-make-or-file-init (cmd &optional opts)
  (if (file-exists-p "Makefile")
      (flymake-simple-make-init)
    (jiros-flymake-file-init cmd opts)))


;; Ruby設定
(defun flymake-ruby-init ()
  (jiros-flymake-file-init "ruby" '("-c")))

(push '("\\.rb\\'" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile\\'" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


;; C設定
(defun flymake-c-init ()
  (jiros-flymake-make-or-file-init
   "gcc" '("-std=c99" "-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))

(push '("\\.[cC]\\'" flymake-c-init) flymake-allowed-file-name-masks)


;; C++設定
(defun flymake-c++-init ()
  (jiros-flymake-make-or-file-init
   "g++" '("-std=c++0x" "-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))

(push '("\\.c\\(pp\\|xx\\|c\\)\\'" flymake-c++-init)
      flymake-allowed-file-name-masks)
(push '("^\\([^:]*\\):\\([0-9]+\\):\\([0-9]+\\) \\(error\\|warning\\): \\(.*\\)$" 1 2 3 5) flymake-err-line-patterns)


;; Emacs Lisp
(defun flymake-elisp-init ()
  (jiros-flymake-file-init "elisplint"))

(push '("\\.el\\'" flymake-elisp-init) flymake-allowed-file-name-masks)


;; LaTeX
(defun flymake-LaTeX-init ()
  (jiros-flymake-file-init "chktex-jp"))

(push '("\\.tex$" flymake-LaTeX-init) flymake-allowed-file-name-masks)
(push '("^\\(\.+\.tex\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)" nil 2 3 4) flymake-err-line-patterns)


;; Makefile
(defun flymake-makefile-init ()
  (jiros-flymake-file-init "make" '("-n" "-s")))

(push '("Makefile\\'" flymake-makefile-init) flymake-allowed-file-name-masks)
(push '("\\.mak\\'" flymake-makefile-init) flymake-allowed-file-name-masks)


;; shell script
(defun flymake-shell-init ()
  (jiros-flymake-file-init "/bin/bash" '("-n")))

(push '("\\.sh\\'" flymake-shell-init) flymake-allowed-file-name-masks)


;; EOF
