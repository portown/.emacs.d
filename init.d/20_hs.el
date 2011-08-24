;;; 20_hs.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/08/20


(require 'hideshow)


;; isearch 時にコードもコメントもオープンする
(setq hs-isearch-open t)

;; hs-hide-all 時にコメントは隠さない
(setq hs-hide-comments-when-hiding-all nil)


(setq hs-special-modes-alist
      (append
       (list
        '(conf-mode nil nil "#" nil nil)
        )
       hs-special-modes-alist))


;; EOF
