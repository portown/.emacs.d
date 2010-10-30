;;; tramp.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/30


(require 'tramp)


(setq tramp-default-method "ssh")

(add-to-list 'tramp-default-proxies-alist
             '("\\`orion\\'" "\\`root\\'" "/ssh:orion:"))





;; EOF
