;;; 30_pukiwiki.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/11/15


(autoload 'pukiwiki-edit "pukiwiki-mode" nil t)
(autoload 'pukiwiki-index "pukiwiki-mode" nil t)
(autoload 'pukiwiki-edit-url "pukiwiki-mode" nil t)


(setq pukiwiki-site-list
      '(
        ("PortWiki" "https://orion/wiki/" nil utf-8-unix)
        ))


(setq pukiwiki-auto-insert t)


;; EOF
