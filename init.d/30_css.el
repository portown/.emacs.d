;;; 30_css.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/08/25


(require 'css-mode)
(require 'hungry-mode)


;; インデントを直す
(setq cssm-indent-function #'cssm-c-style-indenter)


(add-hook 'css-mode-hook
          (lambda ()
            (hungry-mode t)
            ))


;; EOF
