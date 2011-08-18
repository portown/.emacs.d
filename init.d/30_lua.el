;;; lua.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'lua-mode)


(setq lua-indent-level 2)

(add-hook 'lua-mode-hook
          (lambda ()
            (define-key lua-mode-map "\C-m" #'reindent-then-newline-and-indent)
            (define-key lua-mode-map "\C-c\C-c" #'comment-region)
            ))


(setq auto-mode-alist
      (append
       (list
        (cons "\\.lua'" 'lua-mode)
        )
       auto-mode-alist))


;; EOF
