;;; ruby.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)


;; ruby-modeロード後の設定

(eval-after-load "ruby-mode"
  '(progn
     ;; インデントにタブを使うか否か
     ;; t   : タブを使う
     ;; nil : 半角スペースを使う
     (setq ruby-indent-tabs-mode indent-tabs-mode)

     ;; インデントの深さを数値で指定
     (setq ruby-indent-level tab-width)

     ;; 改行時、直前の行もインデント
     (define-key ruby-mode-map "\C-m" #'reindent-then-newline-and-indent)

     ;; 削除をhungryにさせる
     (add-hook 'ruby-mode-hook
               #'(lambda ()
                   (hungry-mode t)
                   ))

     ;; 範囲コメントアウトをc-modeと同じキーに設定
     (define-key ruby-mode-map "\C-c\C-c" #'comment-region)


     ;; ruby-electricの設定

     (require 'ruby-electric)

     ;; 補完するものを文字で指定
     ;; allを指定すると {, [, (, ', ", `, | の全てを補完
     (setq ruby-electric-expand-delimiters-list nil)

     ;; ruby-mode時にruby-electricを有効にする
     (add-hook 'ruby-mode-hook
               #'(lambda ()
                   (ruby-electric-mode t)
                   ))


     ;; ruby-blockの設定

     (require 'ruby-block)

     ;; 対応するブロックが表示されるまでの時間
     (setq ruby-block-delay 0.1)

     ;; 対応するブロックをどのように表示するか
     ;; nil        : 表示しない
     ;; minibuffer : ミニバッファ
     ;; overlay    : 色変え
     ;; t          : minibuffer + overlay
     (setq ruby-block-highlight-toggle t)

     ;; ruby-mode時にruby-blockを有効にする
     (add-hook 'ruby-mode-hook
               #'(lambda ()
                   (ruby-block-mode t)
                   ))
     ))


(require 'flymake)
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


(setq auto-mode-alist
      (append
       (list
        '("\\.rb\\'" . ruby-mode)
        '("Rakefile" . ruby-mode)
        )
       auto-mode-alist))

(add-hook 'ruby-mode-hook
          #'(lambda ()
              ;; Don't want flymake mode for ruby regions in rhtml files
              (if (not (null buffer-file-name))
                  (flymake-mode))
              ))





;; EOF
