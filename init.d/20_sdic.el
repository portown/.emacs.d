;;; sdic.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


;; ロードパスの設定
;; (setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))


;; -------------------------------------------------------------
;; 通常のsdic設定
;; -------------------------------------------------------------

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)


;; -------------------------------------------------------------
;; カーソル連動sdic設定
;; -------------------------------------------------------------

(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)





;; EOF
