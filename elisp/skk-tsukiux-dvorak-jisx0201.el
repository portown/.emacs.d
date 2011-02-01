;;; skk-tsuxiux-dvorak-jisx0201.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/01


(setq skk-jisx0201-base-rule-list
      '(
        ("\n" nil skk-kakutei)
        ("L" nil skk-latin-or-dakuten)
        ("eL" nil skk-jisx0208-latin-mode)
        ("Q" nil skk-set-henkan-point-subr)  ;; [YK] 花では Q
        ("@" nil skk-today)
        ("$" nil skk-display-code-for-char-at-point)
        ("/" nil skk-toggle-kana)
        ("`" nil skk-puurge-from-jisyo)
        ("e\\" nil skk-input-by-code-or-menu)
        ("e " nil ",")
        ("t " nil ",")
        ("o " nil ".")
        ("n " nil ".")

        ("'" nil "ﾘ")   ("t'" nil "ｧ")   ("n'" nil "!")
        ("," nil "ｺ")   ("t," nil "ｬ")   ("n," nil "ｺﾞ")
        ("." nil "ｼ")   ("t." nil "ﾈ")   ("n." nil "ｼﾞ")
        ("p" nil "ﾃ")   ("tp" nil "ﾗ")   ("np" nil "ﾃﾞ")
        ("y" nil "ｮ")   ("ty" nil "ﾒ")
        ("f" nil "ﾂ")   ("ef" nil "ﾇ")   ("of" nil "ﾂﾞ")
        ("g" nil "ﾝ")   ("eg" nil "ﾑ")   ("og" nil "ﾋﾟ")
        ("c" nil "ｲ")   ("ec" nil "ﾐ")   ("oc" nil "ﾎﾟ")
        ("r" nil "ｶ")   ("er" nil "ｴ")   ("or" nil "ｶﾞ")
        ("l" nil "ｰ")   ("el" nil "ｪ")   ("ol" nil "?")

        ("a" nil "ﾊ")   ("ta" nil "ｨ")   ("na" nil "ﾊﾞ")
                        ("to" nil "ﾖ")   ("no" nil "ﾊﾟ")
                        ("te" nil "ｹ")   ("ne" nil "ｹﾞ")
        ("u" nil "ﾄ")   ("tu" nil "ｱ")   ("nu" nil "ﾄﾞ")
        ("i" nil "ﾀ")   ("ti" nil "ﾚ")   ("ni" nil "ﾀﾞ")
        ("d" nil "ｸ")   ("ed" nil "ﾏ")   ("od" nil "ｸﾞ")
        ("h" nil "ｳ")   ("eh" nil "ｵ")   ("oh" nil "ｳﾞ")
                        ("et" nil "ﾎ")   ("ot" nil "ﾎﾞ")
                        ("en" nil "ｿ")   ("on" nil "ｿﾞ")
        ("s" nil "ｷ")   ("es" nil "ｫ")   ("os" nil "ｷﾞ")
        ("-" nil "ﾁ")   ("e-" nil ":")   ("o-" nil "ﾁﾞ")

        (";" nil "ｽ")   ("t;" nil "ｩ")   ("n;" nil "ｽﾞ")
        ("q" nil "ｦ")   ("tq" nil "ﾔ")
        ("j" nil "ﾆ")   ("tj" nil "ｾ")   ("nj" nil "ｾﾞ")
        ("k" nil "ﾅ")   ("tk" nil "ｭ")
        ("x" nil "ｻ")   ("tx" nil "ﾕ")   ("nx" nil "ｻﾞ")
        ("b" nil "ｯ")   ("eb" nil "ﾋ")   ("ob" nil "ﾋﾞ")
        ("m" nil "ﾙ")   ("em" nil "ﾜ")   ("om" nil "ﾌﾟ")
        ("w" nil "ﾉ")   ("ew" nil "ﾌ")   ("ow" nil "ﾌﾞ")
        ("v" nil "ﾓ")   ("ev" nil "ﾛ")   ("ov" nil "ﾍﾟ")
        ("z" nil "ﾍ")   ("ez" nil "/")   ("oz" nil "ﾍﾞ")

        ;; ("eem" nil "ﾜ")
        ;; ("eec" nil "ヰ")
        ;; ("eel" nil "ヱ")
        ;; ("eer" nil "ヵ")
        ;; ("tte" nil "ヶ")
        ("eed" nil "←")
        ("eeh" nil "↓")
        ("eet" nil "↑")
        ("een" nil "→")
        ("eew" nil "‥")
        ("eev" nil "…")
        ("eez" nil "・")
        ("ee-" nil "〜")
        ))


;; Local Variables:
;; coding: iso-2022-7bit
;; End:


;; EOF
