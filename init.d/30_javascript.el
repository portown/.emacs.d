;;; 30_javascript.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/01/22


(autoload 'js2-mode "js2" nil t)


;; デフォルトのインデント幅
(setq js2-basic-offset 2)

;; ファイル保存時に行末の空白を自動的に削除するか否か
(setq js2-cleanup-whitespace nil)

;; 開きカッコを入れた際、閉じカッコを自動的に入力するか否か
(setq js2-mirror-mode nil)

;; カッコやカンマなどの入力時に自動でインデントするか否か
;; 具体的にどの文字でインデントするかはjs2-electric-keysで指定される
(setq js2-auto-indent-p t)

;; インデントキーを複数回押した際、タブ幅を変更するか否か
(setq js2-bounce-indent-flag nil)

;; 改行時に元の行をインデントし直すか否か
(setq js2-indent-on-enter-key t)

;; 改行時に新たな行をインデントするか否か
(setq js2-enter-indents-newline t)


;; 参考：http://8-p.info/emacs-javascript.html
(defun jiros-indent-and-back-to-indentation ()
  (interactive)
  (indent-for-tab-command)
  (let ((point-of-indentation
         (save-excursion
           (back-to-indentation)
           (point))))
    (skip-chars-forward "\s " point-of-indentation)))

(add-hook 'js2-mode-hook
          (lambda ()
            ;; 参考：http://8-p.info/emacs-javascript.html
            (define-key js2-mode-map "\C-i" #'jiros-indent-and-back-to-indentation)
            ))


;; js2-modeは \C-m に改行＋インデントを当てているが、
;; (global-set-key "\C-m" #'newline-and-indent) しているので不要
;; (define-key js2-mode-map "\C-m" nil)


;; 拡張子の設定
(setq auto-mode-alist
      (append
       '(("\\.\\(js\\|json\\)\\'" . js2-mode))
       auto-mode-alist))



;; EOF
