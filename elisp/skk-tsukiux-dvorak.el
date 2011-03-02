;; -*- coding: iso-2022-jp -*-
;; SKK で月配列を使う。
;; [YK] massangeana氏の花配列のEmacs Lispを月配列用に改変。
;;      (see http://www.massangeana.com/mas/charsets/hana/hanasetup.htm#skk)
;;      コメント中の [YK] は改変者による付記を表す。
;;
;; 注意: daredevil SKK + NICOLA-DDSKK がインストールされていることを
;; 前提としている。skk-kanagaki-dakuten, skk-kanagaki-handakuten が
;; あれば daredevil SKK は必要ないが。

;; (when (not (boundp 'skk-hana-ansi)) (setq skk-hana-ansi nil))

(require 'skk-vars)
;; (require 'skk-autoloads)
;; (require 'skk-kanagaki-util)

(setq skk-special-midashi-char-list '(?[ ?]))

;; skk-auto-start-henkan-keyword-list はそのままでよい。

(setq skk-set-henkan-point-key
      '(?\" ?< ?> ?P ?Y ?F ?G ?C ?R
        ?A  ?O ?E ?U ?I ?D ?H ?T ?N ?S ?_
        ?:  ?J ?K ?X ?B ?M ?W ?V ?Z
        ))
(setq skk-downcase-alist
      '((?\" . ?')
        (?<  . ?,)
        (?>  . ?.)
        (?_  . ?-)
        (?:  . ?\;)
        ))

;; `-' で前候補を表示。
(setq skk-previous-candidate-char ?=)  ;; [YK] `=' に変更した。

(setq skk-process-okuri-early nil)  ; ローマ字変換の時以外は意味なし。


;; ;; copied from skk-kanagaki.el

;; (defun skk-kanagaki-set-okurigana (&optional no-sokuon)
;;   "ポイントの直前の文字を送り仮名と見倣して、変換を開始する。
;; ただし、 もうひとつ前の文字が促音だった場合には、 それ以降を送り仮名と見倣す。"
;;   (interactive)
;;   (let ((pt1 (point))
;;         pt2 okuri sokuon)
;;     (setq okuri
;;           (skk-save-point
;;            ;; うう、こんなことをしなければならないのか...
;;            (backward-char 1)
;;            (buffer-substring-no-properties
;;             (setq pt2 (point))
;;             pt1)))
;;     (when okuri
;;       (unless no-sokuon
;;         (setq sokuon
;;               (skk-save-point
;;                (backward-char 2)
;;                (buffer-substring-no-properties
;;                 (point)
;;                 pt2)))
;;         (unless (member sokuon '("っ" "ッ"))
;;           (setq sokuon nil)))
;;       ;;
;;       (skk-save-point
;;        (backward-char (if sokuon 2 1))
;;        (skk-set-marker skk-okurigana-start-point
;;                        (point)))
;;       (setq skk-okuri-char (skk-okurigana-prefix okuri))
;;       (unless skk-current-search-prog-list
;;         (setq skk-current-search-prog-list
;;               skk-search-prog-list))
;;       (skk-set-okurigana))))
;; ;; end copy

;; (defun skk-kanagaki-set-okurigana-if-henkan-on (&optional arg)
;;   (interactive "*p")
;;   (if skk-henkan-mode
;;       (skk-kanagaki-set-okurigana (if (eq (prefix-numeric-value arg) 4) nil t))
;;     "-"))

;; (defun skk-latin-or-dakuten (&optional arg)
;;   "■モードと▼モードでは latin-mode に移行する。
;; ▽モードでは濁点を追加し、先頭の一字以外では濁点を追加した仮名を
;; 送り仮名開始文字とみなして変換を開始する。"
;;   (interactive "*p")
;;   (if (eq skk-henkan-mode 'on)
;;       (progn
;;         (skk-kanagaki-dakuten arg)
;;         (when (< (+ 1 (marker-position skk-kana-start-point)) (point))
;;           (skk-kanagaki-set-okurigana t)))
;;     (skk-latin-mode arg)))

(setq skk-rom-kana-rule-list nil)


(setq skk-rom-kana-base-rule-list
      '(
        ("\n" nil skk-kakutei)
        ("L" nil skk-jisx0208-latin-mode)
        ("Q" nil skk-set-henkan-point-subr)  ;; [YK] 花では Q
        ("@" nil skk-today)
        ("$" nil skk-display-code-for-char-at-point)
        ("/" nil skk-toggle-kana)
        ("e/" nil skk-abbrev-mode)
        ("?" nil skk-jisx0201-mode)
        ("`" nil skk-purge-from-jisyo)
        ;; ("-" nil skk-kanagaki-set-okurigana-if-henkan-on)
        ("e\\" nil skk-input-by-code-or-menu)
        ("e " nil skk-current-touten)
        ("t " nil skk-current-touten)
        ("o " nil skk-current-kuten)
        ("n " nil skk-current-kuten)

        ("'" nil ("リ" . "り"))   ("t'" nil ("ァ" . "ぁ"))   ("n'" nil "！")
        ("," nil ("コ" . "こ"))   ("t," nil ("ャ" . "ゃ"))   ("n," nil ("ゴ" . "ご"))
        ("." nil ("シ" . "し"))   ("t." nil ("ネ" . "ね"))   ("n." nil ("ジ" . "じ"))
        ("p" nil ("テ" . "て"))   ("tp" nil ("ラ" . "ら"))   ("np" nil ("デ" . "で"))
        ("y" nil ("ョ" . "ょ"))   ("ty" nil ("メ" . "め"))
        ("f" nil ("ツ" . "つ"))   ("ef" nil ("ヌ" . "ぬ"))   ("of" nil ("ヅ" . "づ"))
        ("g" nil ("ン" . "ん"))   ("eg" nil ("ム" . "む"))   ("og" nil ("ピ" . "ぴ"))
        ("c" nil ("イ" . "い"))   ("ec" nil ("ミ" . "み"))   ("oc" nil ("ポ" . "ぽ"))
        ("r" nil ("カ" . "か"))   ("er" nil ("エ" . "え"))   ("or" nil ("ガ" . "が"))
        ("l" nil ("ー" . "ー"))   ("el" nil ("ェ" . "ぇ"))   ("ol" nil "？")

        ("a" nil ("ハ" . "は"))   ("ta" nil ("ィ" . "ぃ"))   ("na" nil ("バ" . "ば"))
                                  ("to" nil ("ヨ" . "よ"))   ("no" nil ("パ" . "ぱ"))
                                  ("te" nil ("ケ" . "け"))   ("ne" nil ("ゲ" . "げ"))
        ("u" nil ("ト" . "と"))   ("tu" nil ("ア" . "あ"))   ("nu" nil ("ド" . "ど"))
        ("i" nil ("タ" . "た"))   ("ti" nil ("レ" . "れ"))   ("ni" nil ("ダ" . "だ"))
        ("d" nil ("ク" . "く"))   ("ed" nil ("マ" . "ま"))   ("od" nil ("グ" . "ぐ"))
        ("h" nil ("ウ" . "う"))   ("eh" nil ("オ" . "お"))   ("oh" nil ("ヴ" . "ヴ"))
                                  ("et" nil ("ホ" . "ほ"))   ("ot" nil ("ボ" . "ぼ"))
                                  ("en" nil ("ソ" . "そ"))   ("on" nil ("ゾ" . "ぞ"))
        ("s" nil ("キ" . "き"))   ("es" nil ("ォ" . "ぉ"))   ("os" nil ("ギ" . "ぎ"))
        ("-" nil ("チ" . "ち"))   ("e-" nil "：")            ("o-" nil ("ヂ" . "ぢ"))

        (";" nil ("ス" . "す"))   ("t;" nil ("ゥ" . "ぅ"))   ("n;" nil ("ズ" . "ず"))
        ("q" nil ("ヲ" . "を"))   ("tq" nil ("ヤ" . "や"))
        ("j" nil ("ニ" . "に"))   ("tj" nil ("セ" . "せ"))   ("nj" nil ("ゼ" . "ぜ"))
        ("k" nil ("ナ" . "な"))   ("tk" nil ("ュ" . "ゅ"))
        ("x" nil ("サ" . "さ"))   ("tx" nil ("ユ" . "ゆ"))   ("nx" nil ("ザ" . "ざ"))
        ("b" nil ("ッ" . "っ"))   ("eb" nil ("ヒ" . "ひ"))   ("ob" nil ("ビ" . "び"))
        ("m" nil ("ル" . "る"))   ("em" nil ("ワ" . "わ"))   ("om" nil ("プ" . "ぷ"))
        ("w" nil ("ノ" . "の"))   ("ew" nil ("フ" . "ふ"))   ("ow" nil ("ブ" . "ぶ"))
        ("v" nil ("モ" . "も"))   ("ev" nil ("ロ" . "ろ"))   ("ov" nil ("ペ" . "ぺ"))
        ("z" nil ("ヘ" . "へ"))   ("ez" nil "／")            ("oz" nil ("ベ" . "べ"))

        ("e[" nil "「")
        ("e]" nil "」")
        ("ee[" nil "『")
        ("ee]" nil "』")
        ("(" nil "（")
        (")" nil "）")
        ("[" nil "［")
        ("]" nil "］")
        ("{" nil "｛")
        ("}" nil "｝")
        ("tt," nil "＜")
        ("tt." nil "＞")
        ("\\" nil "＼")
        ("ee\\" nil "￥")
        ("eem" nil ("ヮ" . "ゎ"))
        ("eec" nil ("ヰ" . "ゐ"))
        ("eel" nil ("ヱ" . "ゑ"))
        ("eer" nil "ヵ")
        ("tte" nil "ヶ")
        ("eed" nil "←")
        ("eeh" nil "↓")
        ("eet" nil "↑")
        ("een" nil "→")
        ("eew" nil "‥")
        ("eev" nil "…")
        ("eez" nil "・")
        ("ee-" nil "〜")
        ))

(load "skk-tsukiux-dvorak-jisx0201")


;; EOF
