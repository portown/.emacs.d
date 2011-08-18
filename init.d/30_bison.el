;;; bison.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'bison-mode "bison-mode" "bison" t)


(setq auto-mode-alist
      (append
       (list
        (cons "\\.y\\'" 'bison-mode))
       auto-mode-alist))





;; EOF
