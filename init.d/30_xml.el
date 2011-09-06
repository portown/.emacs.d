;;; 30_xml.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/08/20


(require 'nxml-mode)
(require 'hungry-mode)


(setq auto-mode-alist
      (append
       (list
        '("\\.html\\'" . nxml-mode)
        '("\\.tpl\\'" . nxml-mode)
        )
        auto-mode-alist))


(add-hook 'nxml-mode-hook
          (lambda ()
            (hungry-mode t)
            ))


;; EOF
