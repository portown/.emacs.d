;;; org.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'org-install)


(eval-after-load "org"
  '(progn
     ;; フック
     (add-hook 'org-mode-hook
               #'(lambda ()
                   (define-key org-mode-map [?\C-,]
                     #'(lambda ()
                         (interactive)
                         (set-frame-selected-window nil (previous-window))))
                   ))
     ))


;; 関連付け
(setq auto-mode-alist
      (append
       (list
        '("\\.org\\'" . org-mode)
        '("TODO" . org-mode)
        )
       auto-mode-alist))


;; EOF
