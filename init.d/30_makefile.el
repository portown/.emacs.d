;;; 30_makefile.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


;; .makのファイルに関連付ける
(setq auto-mode-alist (append (list
                               '("\\.mak$" . makefile-mode)
                               '("Makefile" . makefile-mode))
                              auto-mode-alist))

;; ;; makefileのフック設定
;; (add-hook 'makefile-mode-hook
;;           '(lambda ()
;;              ))




;; EOF
