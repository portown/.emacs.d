;;; skk.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/03


;; ;; ACT用設定

;; (setq skk-use-act t)


;; ;; NICOLA用設定

;; (setq skk-use-kana-keyboard t)
;; (setq skk-kanagaki-keyboard-type 'nicola-dvorak)

;; ;; モードラインに表示される文字
;; (setq skk-nicola-hiragana-mode-string "い")
;; (setq skk-nicola-katakana-mode-string "イ")

;; ;; 親指シフト認識時間
;; (setq skk-nicola-interval 0.08)

;; ;; 左親指キー
;; (setq skk-nicola-lshift-keys '([muhenkan]))

;; ;; 右親指キー
;; (setq skk-nicola-rshift-keys '([henkan]))


;; 月配列(Ux)-Dvorak用設定

(load "skk-tsukiux-dvorak")


;; その他の設定


;; SKKのメッセージを日本語で表示するか否か
(setq skk-japanese-message-and-error nil)


;; SKKのチュートリアルファイルのパス
(setq skk-tut-file "/usr/share/skk/SKK.tut")


;; 動的補完を行うか否か
(setq skk-dcomp-activate t)


;; ;; 接頭辞・接尾辞開始文字の設定
;; (setq skk-special-midashi-char-list '(?>))


;; 半角カナの入力を許可するか否か
(setq skk-use-jisx0201-input-method t)


;; 句読点リストの設定
(setq-default skk-kutouten-type 'jp)


;; 変換候補選択キーの設定
;; Dvorak仕様
(setq skk-henkan-show-candidates-keys '(?a ?o ?e ?u ?h ?t ?n))


;; 変換候補の表示方法の設定
;; 変換候補表示方法は以下の3つ
;;   エコーエリア：見やすいがミニバッファ内で変換しようとするとコケる
;;   ツールチップ：環境によると思われるが見づらい
;;   インライン　：文章中に現れるためレイアウトが一時的に崩れる
;; ツールチップとインライン両方設定するとインライン優先のよう

(setq skk-show-tooltip nil)
(setq skk-show-inline t)


;; SKKのモードラインに表示される文字を設定
(setq skk-latin-mode-string "a")
(setq skk-hiragana-mode-string "あ")
(setq skk-katakana-mode-string "ア")
(setq skk-jisx0201-mode-string "ｱ")
(setq skk-jisx0208-latin-mode-string "ａ")


;; 辞書設定

;; 辞書サーバを使う設定
(setq skk-large-jisyo nil)
(setq skk-server-host "127.0.0.1")
(setq skk-server-portnum 1178)
(setq skk-preload nil)

;; ;; 辞書サーバを使わない設定
;; (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
;; (setq skk-server-host nil)
;; (setq skk-server-portnum nil)
;; (setq skk-preload t)


;; SKK起動時のフック
(add-hook 'skk-mode-hook
          #'(lambda ()
              (ccc-setup)
              ;; (define-key skk-j-mode-map "\C-Q" 'skk-jisx0201-mode)
              ))


;; ;; ローマ字ルールの変更
;; ;; 現在は月配列なので使用せず
;; (setq skk-rom-kana-rule-list
;;       '(
;;         ("si"  nil ("スィ" . "すぃ"))
;;         ("ti"  nil ("ティ" . "てぃ"))
;;         ("tu"  nil ("トゥ" . "とぅ"))
;;         ("dwo" nil ("ドゥ" . "どぅ"))
;;         ("hh"  "h" ("ッ"   . "っ"))
;;         ("wi"  nil ("ヰ"   . "ゐ"))
;;         ("whi" nil ("ウィ" . "うぃ"))
;;         ("we"  nil ("ヱ"   . "ゑ"))
;;         ("whe" nil ("ウェ" . "うぇ"))
;;         ("who" nil ("ウォ" . "うぉ"))
;;         ("kwa" nil ("クァ" . "くぁ"))
;;         ("kwi" nil ("クィ" . "くぃ"))
;;         ("kwe" nil ("クェ" . "くぇ"))
;;         ("kwo" nil ("クォ" . "くぉ"))
;;         ("tsa" nil ("ツァ" . "つぁ"))
;;         ("tsi" nil ("ツィ" . "つぃ"))
;;         ("tse" nil ("ツェ" . "つぇ"))
;;         ("tso" nil ("ツォ" . "つぉ"))
;;         (" " nil ("　" . "　"))
;;         ("!" nil ("！" . "！"))
;;         ("(" nil ("（" . "（"))
;;         (")" nil ("）" . "）"))
;;         ))


;; EOF
