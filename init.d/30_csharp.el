;;; 30_csharp.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/04/17


(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)


(setq auto-mode-alist
      (append
       (list
        '("\\.cs\\'" . csharp-mode)
        )
       auto-mode-alist))


(require 'compile)
(push '("^[ \t]*\\[csc\\] \\(.*\\)(\\([0-9]+\\)): error" 1 2 nil 2) compilation-error-regexp-alist)
(push '("^[ \t]*\\[csc\\] \\(.*\\)(\\([0-9]+\\)): warning" 1 2 nil 1) compilation-error-regexp-alist)


;; EOF
