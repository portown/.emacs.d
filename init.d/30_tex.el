;;; tex.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/08


(load "auctex.el")


(setq TeX-default-mode 'japanese-latex-mode)

(setq TeX-parse-self t)

(setq TeX-newline-function 'reindent-then-newline-and-indent)


;; (add-hook 'TeX-mode-hook
;;           #'(lambda ()
;;               ))


(setq auto-mode-alist
      (append
       '(
         ("\\.tex\\'" . japanese-latex-mode)
         )
       auto-mode-alist))


;; ;; デフォルトのTeXモードを設定
;; (setq tex-default-mode 'latex-mode)

;; ;; 各プロセスの実行コマンドを指定
;; (setq tex-run-command "ptex")
;; (setq latex-run-command "platex")
;; (setq tex-dvi-view-command "xdvi-ja -expertmode 0 -text-encoding euc-jp")

;; (add-hook 'tex-mode-hook
;;           #'(lambda ()
;;               ;; texはUnicodeに対応してないのでEUC-JPで編集する
;;               (unless (equal buffer-file-coding-system 'euc-jp-unix)
;;                 (set-buffer-file-coding-system 'euc-jp-unix))

;;               ;; SKKの句読点を変更する
;;               (setq skk-kutouten-type 'en)
;;               ))

;; (add-hook 'latex-mode-hook
;;           #'(lambda ()
;;               ;; texはUnicodeに対応してないのでEUC-JPで編集する
;;               (unless (equal buffer-file-coding-system 'euc-jp-unix)
;;                 (message "latex")
;;                 (set-buffer-file-coding-system 'euc-jp-unix))

;;               ;; SKKの句読点を変更する
;;               (setq skk-kutouten-type 'en)
;;               ))


;; EOF
