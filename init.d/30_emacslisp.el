;;; emacslisp.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'hungry-mode "hungry-mode" "Minor mode for hungry delete." t)


;; Emacs Lispのフック設定
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (hungry-mode t)
              (if (not (null buffer-file-name))
                  (flymake-mode 1))
              (define-key emacs-lisp-mode-map "\C-c\C-c" #'comment-region)
              ))



;; EOF
