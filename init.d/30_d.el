;;; 30_d.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/03/04


(autoload 'd-mode "d-mode" "Major mode for editing D code." t)


(setq auto-mode-alist
      (append
       (list
        '("\\.d\\'" . d-mode)
        )
       auto-mode-alist))


(add-hook 'd-mode-hook
          (lambda ()
            (require 'hungry-mode)
            (hungry-mode t)
            ))


;; EOF
