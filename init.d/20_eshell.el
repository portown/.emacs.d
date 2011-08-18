;;; 20_eshell.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(require 'eshell)
(require 'em-glob)
(require 'em-hist)
(require 'em-cmpl)
(require 'em-prompt)
(require 'em-term)


;; rm *.*で下のディレクトリを消しすぎないように
(setq eshell-glob-include-dot-dot nil)

;; Eshell終了時にヒストリの保存をいちいち聞かないようにする
(setq eshell-save-history-on-exit nil)

;; サイクル補完を行うか否か
(setq eshell-cmpl-cycle-completions nil)

;; プロンプトの設定
(setq eshell-prompt-function
      (lambda ()
        (concat
         (getenv "USER") "@" (system-name)
         ;; (eshell/pwd)                   ; カレントディレクトリ
         (if (= (user-uid) 0) "#" "$")
         " ")))

;; プロンプトを認識する正規表現の設定
(setq eshell-prompt-regexp "^[^@ #$]+@[^ #$]+[#$] ")


(setq eshell-visual-commands
      (append
       (list
        "ssh"
        )
       eshell-visual-commands))


(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; EOF
