;; meadow-encoding.el


;; mule-ucs
(require 'jisx0213)
(require 'unicode)
(require 'xml)

;; 日本語の優先度を高くする
(un-define-change-charset-order
 '(ascii
   japanese-jisx0208
   japanese-jisx0213-1 japanese-jisx0213-2
   japanese-jisx0212

   mule-unicode-0100-24ff

   katakana-jisx0201

   mule-unicode-2500-33ff mule-unicode-e000-ffff
   latin-jisx0201
   ))

;; 基本的な文字コードの設定
(set-terminal-coding-system 'sjis)
(setq file-name-coding-system 'sjis)        ; ファイル名の文字コード
(set-selection-coding-system 'utf-16le-dos) ; クリップボードの文字コード

;; シェルでの文字コード設定
(add-hook 'shell-mode-hook
          (lambda ()
            (set-buffer-process-coding-system 'sjis 'sjis)))



;; EOF
