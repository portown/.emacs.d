;;; 30_shell.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/17


(autoload 'sh-mode "sh-script" "Major mode for editing shell scripts." t)


(eval-after-load "sh-script"
  '(progn
     ;; インデント幅の設定
     (setq-default sh-basic-offset 2)
     (setq-default sh-indentation 2)

     ;; フック設定
     (add-hook 'sh-mode-hook
               (lambda ()
                 (require 'hungry-mode)
                 (hungry-mode t)

                 (require 'safe-flymake-mode)
                 (safe-flymake-mode)
                 ))
     ))


;; EOF
