;;; lua.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'lua-mode "lua-mode" "Lua editing mode." t)


(eval-after-load "lua-mode"
  '(progn
     (define-key lua-mode-map "\C-m" 'reindent-then-newline-and-indent)
     (define-key lua-mode-map "\C-c\C-c" 'comment-region)

     (setq lua-indent-level 2)

     (add-hook 'lua-mode-hook
               #'(lambda ()
                   ))
     ))


(setq auto-mode-alist (append (list
                               '("\\.lua$" . lua-mode))
                              auto-mode-alist))


;; EOF
