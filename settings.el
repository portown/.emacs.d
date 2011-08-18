;;; settings.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/27


;; デバッグモード
(setq debug-on-error nil)

(setq skype--com-debug-mode nil)

;; (setq flymake-log-level 3)


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

;(setq jiros-setting-font-string "VL Gothic-10")
(setq jiros-setting-font-string "Migu 1M-10")
(setq-default line-spacing 2)

(setq jiros-setting-frame-width 179)
(setq jiros-setting-frame-height 63)

(setq jiros-setting-init-frame-alist-list
      `(((frame-alist . ((title . "Main")
                         (visibility . t)
                         ))
         )
        ((frame-alist . ((title . "Twitter")
                         (visibility . t)
                         ))
         ;; (after-hook . ,(lambda () (twit)))
         )
        ((frame-alist . ((title . "Skype")
                         (visibility . t)
                         ))
         (after-hook . ,(lambda ()
                          (ignore-errors
                            (skype--open-all-users-buffer-command))))
;                            (error (princ "%s" ERR)))))
         )
        ;; ((frame-alist . ((title . "Schedule")
        ;;                  (visibility . t)
        ;;                  ))
        ;;  (after-hook . ,(lambda () (org-agenda-list)))
        ;;  )
        ))

(setq jiros-setting-twitter-interval 20)


;; EOF
