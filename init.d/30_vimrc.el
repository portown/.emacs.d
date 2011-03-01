;;; 30_vimrc.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/17


(define-generic-mode 'vimrc-generic-mode
  '()
  '()
  '(("^[\t ]*:?\\(!\\|ab\\|map\\|unmap\\)[^\r\n\"]*\"[^\r\n\"]*\\(\"[^\r\n\"]*\"[^\r\n\"]*\\)*$"
     (0 font-lock-warning-face))
    ("\\(^\\|[\t ]\\)\\(\".*\\)$"
     (2 font-lock-comment-face))
    ("\"\\([^\n\r\"\\]\\|\\.\\)*\""
     (0 font-lock-string-face)))
  '("/vimrc\\'" "\\.vim\\(rc\\)?\\'" "\\.gvim\\(rc\\)?\\'")
  '((lambda ()
      (modify-syntax-entry ?\" ".")))
  "Generic mode for Vim configuration files.")


;; EOF
