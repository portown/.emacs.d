;;; 30_conf.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/08/21


(require 'conf-mode)
(require 'hideshow)


(add-hook 'conf-mode-hook
          (lambda ()
            (hs-minor-mode 1)
            (make-local-variable 'hs-hide-comments-when-hiding-all)
            (setq hs-hide-comments-when-hiding-all t)
            (hs-hide-all)
            ))


;; EOF
