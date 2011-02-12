;;; 30_tex.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/08


(load "auctex.el")


(eval-after-load "tex"
  '(progn
     (setq TeX-default-mode 'japanese-latex-mode)

     (setq TeX-parse-self t)

     (setq TeX-newline-function 'reindent-then-newline-and-indent)
     ))


(eval-after-load "latex"
  '(progn
     (add-hook 'LaTeX-mode-hook
               #'(lambda ()
                   (setq skk-kutouten-type 'en)
                   (hungry-mode t)
                   ;; (flymake-mode 1)
                   ))
     ))


(setq auto-mode-alist
      (append
       '(
         ("\\.tex\\'" . japanese-latex-mode)
         )
       auto-mode-alist))




;; EOF
