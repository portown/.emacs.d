;;; flex.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'flex-mode "flex-mode" "flex" t)


(setq auto-mode-alist
      (append
       (list
        '("\\.l\\'" . flex-mode)
        )
       auto-mode-alist))




;; EOF
