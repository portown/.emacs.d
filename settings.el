;;; settings.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/27


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

(setq jiros-setting-font-string "VL ゴシック-11")

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

(setq jiros-setting-twitter-interval 20)


;; EOF
