;;; 02_paren.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/06/18


;; (require 'paren)


;; ;; 対応するカッコに色を付ける
;; (show-paren-mode t)

;; ;; 対応するカッコに色付けするモード
;; ;; parenthesis: 対応するカッコに色付けする
;; ;; expression:  カッコの中身を色付けする
;; ;; mixed:       カッコが画面内にあれば parenthesis、なければ expression
;; (setq show-paren-style 'mixed)

;; ;; 対応するカッコに色付けする、その色
;; (set-face-background 'show-paren-match-face "navy")
;; ;; (set-face-foreground 'show-paren-match-face "SkyBlue")


(require 'mic-paren)


(paren-activate)


(setq paren-match-face 'bold)
(setq paren-sexp-mode t)


;; EOF
