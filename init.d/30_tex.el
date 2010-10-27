;;; 30_tex.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/08


(load "auctex.el")


(setq TeX-default-mode 'japanese-latex-mode)

(setq TeX-parse-self t)

(setq TeX-newline-function 'reindent-then-newline-and-indent)


;; (add-hook 'TeX-mode-hook
;;           #'(lambda ()
;;               ))


(setq auto-mode-alist
      (append
       '(
         ("\\.tex\\'" . japanese-latex-mode)
         )
       auto-mode-alist))




;; EOF
