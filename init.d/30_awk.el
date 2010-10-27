;;; 30_awk.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(autoload 'awk-mode "cc-mode" nil t)


;; 関連付け
(setq auto-mode-alist (append (list
                               '("\\.awk$" . awk-mode))
                              auto-mode-alist))

;; ;; フック設定
;; (add-hook 'awk-mode-hook
;;           '(lambda ()
;;              ))




;; EOF
