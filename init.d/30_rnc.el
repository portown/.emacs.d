;;; rnc.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/20


(autoload 'rnc-mode "rnc-mode")

(setq auto-mode-alist
      (append
       (list
        '("\\.rnc\\'" . rnc-mode)
        )
       auto-mode-alist))





;; EOF
