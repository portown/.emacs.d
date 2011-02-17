;;; emacslisp.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'hungry-mode "hungry-mode" "Minor mode for hungry delete." t)
(require 'safe-flymake-mode)


;; Emacs Lispのフック設定
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (hungry-mode t)
              ;; (safe-flymake-mode)
              (define-key emacs-lisp-mode-map "\C-c\C-c" #'comment-region)
              ))



;; EOF
