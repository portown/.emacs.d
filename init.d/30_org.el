;;; org.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'org-install)


(eval-after-load "org"
  '(progn
     (define-key org-mode-map [?\C-,] nil)

     ;; ;; フック
     ;; (add-hook 'org-mode-hook
     ;;           (lambda ()
     ;;             ))
     ))


;; 関連付け
(setq auto-mode-alist
      (append
       (list
        ;; '("\\.org\\'" . org-mode)
        '("TODO" . org-mode)
        )
       auto-mode-alist))


;; 設定ファイルの読み込み
(load "~/.emacs.d/settings/org.el")


;; EOF
