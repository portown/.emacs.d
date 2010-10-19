;; ibuffer.el


(require 'ibuffer)


;;; バッファリストの順番
(setq ibuffer-default-sorting-mode 'recency)

;;; 表示する項目の定義 - 文字エンコーディング
(define-ibuffer-column coding           ; シンボル
  (:name " coding ")                    ; 表示する名前
  ;; 文字コードを返す関数
  (if (coding-system-get buffer-file-coding-system 'mime-charset)
      (format " %s" (coding-system-get buffer-file-coding-system 'mime-charset))
    " undefined"))

;;; フォーマットの設定
(setq ibuffer-formats
      '((mark modified read-only (coding 15 15) " " (name 30 30) " " (size 6 -1 ) " " (mode 16 16) " " filename)
        (mark (coding 15 15) " " (name 30 -1) " " filename)))

;;; 既存のバッファリストを置き換える
(global-set-key "\C-x\C-b" 'ibuffer)



;; EOF
