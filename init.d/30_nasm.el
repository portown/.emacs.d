;;; nasm.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'nasm-mode)


(setq auto-mode-alist
      (append
       (list
        '("\\.nasm\\'" . nasm-mode)
        )
       auto-mode-alist))

(add-hook 'nasm-mode-hook
          #'(lambda ()
              ;; タブ幅を8に
              (setq tab-width 8)
              (setq tab-stop-list
                    '(8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))
              ))



;; EOF
