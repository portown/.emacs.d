;;; 30_php.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/12/10


(require 'php-mode)
(require 'hungry-mode)


(define-key php-mode-map [?\C-.] nil)


(add-hook 'php-mode-hook
          (lambda ()
            (hungry-mode t)
            ))


(setq auto-mode-alist
      (append
       (list
        '("\\.php\\'" . php-mode)
        )
       auto-mode-alist))


;; EOF
