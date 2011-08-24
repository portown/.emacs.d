;;; 12_fontlock.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(require 'whitespace)


;; -------------------------------------------------------------
;; 特殊文字の色付け
;; -------------------------------------------------------------

(global-whitespace-mode 1)

(setq whitespace-style '(face trailing tabs tab-mark spaces space-mark))

(setq whitespace-space-regexp "\\(\u3000\\)")

(setq whitespace-display-mappings
      (list
       '(space-mark ?\u3000 [?\□])
       '(tab-mark ?\t [?\xBB ?\t])
       ))

(set-face-foreground 'whitespace-space "light slate gray")
(set-face-background 'whitespace-space nil)

(set-face-foreground 'whitespace-tab "light slate gray")
(set-face-background 'whitespace-tab nil)

(set-face-foreground 'whitespace-trailing "light slate gray")
(set-face-background 'whitespace-trailing nil)
(set-face-underline-p 'whitespace-trailing t)

;; (defgroup jiros-customfont nil
;;   "jiros custom font"
;;   :group 'faces)

;; ;; 全角スペースに適用する face
;; (defface jiros-customfont-widespace-face
;;   '((t (:background "gray"))
;;     )
;;   "for wide space"
;;   :group 'jiros-customfont)
;; (defvar jiros-customfont-widespace-face 'jiros-customfont-widespace-face)

;; ;; タブに適用する face
;; (defface jiros-customfont-tab-face
;;   '((t (:background "gray26"))
;;     )
;;   "for tab"
;;   :group 'jiros-customfont)
;; (defvar jiros-customfont-tab-face 'jiros-customfont-tab-face)


;; (defface jiros-customfont-trail-face
;;   '((t (:foreground "SteelBlue" :underline t))
;;     )
;;   "for trailing whitespace"
;;   :group 'jiros-customfont)
;; (defvar jiros-customfont-trail-face 'jiros-customfont-trail-face)

;; (defadvice font-lock-mode (before jiros-customfont-lock-mode ())
;;   (font-lock-add-keywords
;;    major-mode
;;    '(("\t" 0 jiros-customfont-tab-face append)
;;      ("　" 0 jiros-customfont-widespace-face append)
;;      ("[ \t]+$" 0 jiros-customfont-trail-face append)
;;      )))
;; (ad-enable-advice 'font-lock-mode 'before 'jiros-customfont-lock-mode)
;; (ad-activate 'font-lock-mode)





;; EOF
