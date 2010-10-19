;; encoding.el


;; UTF-8の設定
(set-terminal-coding-system 'utf-8-unix) ; デフォルトのファイルエンコーディング
(prefer-coding-system 'utf-8-unix)       ; ファイルの文字コード解析での候補に追加
(set-keyboard-coding-system 'utf-8-unix) ; キーボード入力のエンコーディング
(setq locale-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)



;; EOF
