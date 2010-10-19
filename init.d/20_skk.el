;; skk.el


(require 'skk-autoloads)


;; ツールチップを表示する
(setq skk-show-tooltip t)

;; インライン表示する(よく分からん
(setq skk-show-inline t)

;; SKKのメッセージを日本語で表示しない
(setq skk-japanese-message-and-error nil)

;; ;; SKKのチュートリアル
;; (setq skk-tut-file "/usr/local/share/emacs/site-lisp/skk/SKK.tut")

;; 動的補完を行う
(setq skk-dcomp-activate t)

;; 接頭辞・接尾辞開始文字の設定
(setq skk-special-midashi-char-list '(?>))


;; ↓サーバの設定↓
;; (if yas-using-skk-server
;;     (progn
      ;; 大規模辞書はなし
      (setq skk-large-jisyo nil)

      ;; サーバホスト
      (setq skk-server-host "127.0.0.1")

      ;; サーバのポート番号
      (setq skk-server-portnum 1178)
      ;; )
  ;; ↑サーバの設定↑

  ;; (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L.cdb")
  ;; )


;; 辞書をEmacs起動時にロードしない
(setq skk-preload nil)

;; SKKのモードラインに表示される文字を設定
(setq skk-latin-mode-string "a")
(setq skk-hiragana-mode-string "あ")
(setq skk-katakana-mode-string "ア")
(setq skk-jisx0201-mode-string "ｱ")
(setq skk-jisx0208-latin-mode-string "ａ")

;; 半角カナの入力を許可する
(setq skk-use-jisx0201-input-method t)

;; SKK起動時のフック
(add-hook 'skk-mode-hook
          #'(lambda ()
              (define-key skk-j-mode-map "\C-Q" 'skk-jisx0201-mode)
              ))

;; isearchでSKKを使えるように
(add-hook 'isearch-mode-hook
          #'(lambda ()
              (when (and (boundp 'skk-mode)
                         skk-mode
                         skk-isearch-mode-enable)
                (skk-isearch-mode-setup))))
(add-hook 'isearch-mode-end-hook
          #'(lambda ()
              (when (and (featurep 'skk-isearch)
                         skk-isearch-mode-enable)
                (skk-isearch-mode-cleanup))))

;; ローマ字ルールの変更
(setq skk-rom-kana-rule-list
      '(
        ;; ("si"  nil ("スィ" . "すぃ"))
        ;; ("ti"  nil ("ティ" . "てぃ"))
        ;; ("tu"  nil ("トゥ" . "とぅ"))
        ;; ("dwo" nil ("ドゥ" . "どぅ"))
        ;; ("hh"  "h" ("ッ"   . "っ"))
        ;; ("wi"  nil ("ヰ"   . "ゐ"))
        ;; ("whi" nil ("ウィ" . "うぃ"))
        ;; ("we"  nil ("ヱ"   . "ゑ"))
        ;; ("whe" nil ("ウェ" . "うぇ"))
        ;; ("who" nil ("ウォ" . "うぉ"))
        ;; ("kwa" nil ("クァ" . "くぁ"))
        ;; ("kwi" nil ("クィ" . "くぃ"))
        ;; ("kwe" nil ("クェ" . "くぇ"))
        ;; ("kwo" nil ("クォ" . "くぉ"))
        ;; ("tsa" nil ("ツァ" . "つぁ"))
        ;; ("tsi" nil ("ツィ" . "つぃ"))
        ;; ("tse" nil ("ツェ" . "つぇ"))
        ;; ("tso" nil ("ツォ" . "つぉ"))
        (" " nil ("　" . "　"))
        ("!" nil ("！" . "！"))
        ("(" nil ("（" . "（"))
        (")" nil ("）" . "）"))
        ))

;; 変換候補選択キーの設定
(setq skk-henkan-show-candidates-keys '(?a ?o ?e ?u ?h ?t ?n))

;; ;; ACTの使用
;; (setq skk-use-act t)

;; NICOLAの使用
(setq skk-use-kana-keyboard t)
(setq skk-kanagaki-keyboard-type 'nicola-dvorak)

;; モードラインに表示される文字
(setq skk-nicola-hiragana-mode-string "い")
(setq skk-nicola-katakana-mode-string "イ")

;; 親指シフト認識時間
(setq skk-nicola-interval 0.08)

;; 右親指キー
(setq skk-nicola-rshift-keys '([henkan]))





;; EOF
