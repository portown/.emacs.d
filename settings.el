;;; settings.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/27


;; 起動環境の判定
(load "~/.emacs.d/env")


;; -------------------------------------------------------------
;; オプション
;; -------------------------------------------------------------

(setq user-full-name "YASUDA Jiro")
(setq user-mail-address "jiros@softlab.cs.tsukuba.ac.jp")

(setq jiros-setting-elisp-directory
      '("~/.emacs.d/elisp")
      )

(setq jiros-setting-use-skk-server t)

(setq jiros-setting-font-family "MigMix 1M")
(setq jiros-setting-font-size 11)

(setq jiros-setting-frame-width 99)
(setq jiros-setting-frame-height 69)




;; Emacs Lisp読み込みパスを追加
(load "~/.emacs.d/addpath")





;; EOF
