;;; 30_hatena.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/09


(require 'simple-hatena-mode)


(setq simple-hatena-default-id "portown")


(add-hook 'simple-hatena-mode-hook
          #'(lambda ()
              (font-lock-mode t)
              ))


;; EOF
