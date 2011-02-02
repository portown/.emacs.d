;;; settings.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/27


;; 起動環境の判定
(load "~/.emacs.d/env")

;; デバッグモード
(setq debug-on-error nil)


;; -------------------------------------------------------------
;; オプション
;; -------------------------------------------------------------

(setq user-full-name "YASUDA Jiro")
(setq user-mail-address "portown09@gmail.com")

(setq jiros-setting-elisp-directory
      '("~/.emacs.d/elisp"
        "/usr/local/share/emacs/site-lisp"
        )
      )

(setq jiros-setting-use-skk-server t)

(setq jiros-setting-font-family "MigMix 1M")
(setq jiros-setting-font-size 11)

(setq jiros-setting-frame-width 99)
(setq jiros-setting-frame-height 69)

(setq jiros-setting-init-frame-alist-list
      `(((frame-alist . ((title . "Main")
                         (visibility . t)
                         ))
         )
        ((frame-alist . ((title . "Twitter")
                         (left . 2490)
                         (width . 67)
                         (visibility . t)
                         ))
         ;; (after-hook . ,(lambda () (twit)))
         )
        ))

;; (set-frame-cursor-color nil (frame-parameter nil 'cursor-color))

(setq jiros-setting-twitter-interval 40)




;; Emacs Lisp読み込みパスを追加
(load "~/.emacs.d/addpath")


(load "~/.emacs.d/settings/tramp")





;; EOF
