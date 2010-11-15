;;; emacslisp.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


;; Emacs Lispのフック設定
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (define-key emacs-lisp-mode-map "\C-c\C-c" 'comment-region)
              ))



;; EOF
