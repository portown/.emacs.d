;;; skk-tsuxiux-dvorak-jisx0201.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/01


(setq skk-jisx0201-base-rule-list
      '(
        ("\n" nil skk-kakutei)
        ("L" nil skk-latin-or-dakuten)
        ("eL" nil skk-jisx0208-latin-mode)
        ("Q" nil skk-set-henkan-point-subr)  ;; [YK] $B2V$G$O(B Q
        ("@" nil skk-today)
        ("$" nil skk-display-code-for-char-at-point)
        ("/" nil skk-toggle-kana)
        ("`" nil skk-puurge-from-jisyo)
        ("e\\" nil skk-input-by-code-or-menu)
        ("e " nil ",")
        ("t " nil ",")
        ("o " nil ".")
        ("n " nil ".")

        ("'" nil "(IX(B")   ("t'" nil "(I'(B")   ("n'" nil "!")
        ("," nil "(I:(B")   ("t," nil "(I,(B")   ("n," nil "(I:^(B")
        ("." nil "(I<(B")   ("t." nil "(IH(B")   ("n." nil "(I<^(B")
        ("p" nil "(IC(B")   ("tp" nil "(IW(B")   ("np" nil "(IC^(B")
        ("y" nil "(I.(B")   ("ty" nil "(IR(B")
        ("f" nil "(IB(B")   ("ef" nil "(IG(B")   ("of" nil "(IB^(B")
        ("g" nil "(I](B")   ("eg" nil "(IQ(B")   ("og" nil "(IK_(B")
        ("c" nil "(I2(B")   ("ec" nil "(IP(B")   ("oc" nil "(IN_(B")
        ("r" nil "(I6(B")   ("er" nil "(I4(B")   ("or" nil "(I6^(B")
        ("l" nil "(I0(B")   ("el" nil "(I*(B")   ("ol" nil "?")

        ("a" nil "(IJ(B")   ("ta" nil "(I((B")   ("na" nil "(IJ^(B")
                        ("to" nil "(IV(B")   ("no" nil "(IJ_(B")
                        ("te" nil "(I9(B")   ("ne" nil "(I9^(B")
        ("u" nil "(ID(B")   ("tu" nil "(I1(B")   ("nu" nil "(ID^(B")
        ("i" nil "(I@(B")   ("ti" nil "(IZ(B")   ("ni" nil "(I@^(B")
        ("d" nil "(I8(B")   ("ed" nil "(IO(B")   ("od" nil "(I8^(B")
        ("h" nil "(I3(B")   ("eh" nil "(I5(B")   ("oh" nil "(I3^(B")
                        ("et" nil "(IN(B")   ("ot" nil "(IN^(B")
                        ("en" nil "(I?(B")   ("on" nil "(I?^(B")
        ("s" nil "(I7(B")   ("es" nil "(I+(B")   ("os" nil "(I7^(B")
        ("-" nil "(IA(B")   ("e-" nil ":")   ("o-" nil "(IA^(B")

        (";" nil "(I=(B")   ("t;" nil "(I)(B")   ("n;" nil "(I=^(B")
        ("q" nil "(I&(B")   ("tq" nil "(IT(B")
        ("j" nil "(IF(B")   ("tj" nil "(I>(B")   ("nj" nil "(I>^(B")
        ("k" nil "(IE(B")   ("tk" nil "(I-(B")
        ("x" nil "(I;(B")   ("tx" nil "(IU(B")   ("nx" nil "(I;^(B")
        ("b" nil "(I/(B")   ("eb" nil "(IK(B")   ("ob" nil "(IK^(B")
        ("m" nil "(IY(B")   ("em" nil "(I\(B")   ("om" nil "(IL_(B")
        ("w" nil "(II(B")   ("ew" nil "(IL(B")   ("ow" nil "(IL^(B")
        ("v" nil "(IS(B")   ("ev" nil "(I[(B")   ("ov" nil "(IM_(B")
        ("z" nil "(IM(B")   ("ez" nil "/")   ("oz" nil "(IM^(B")

        ;; ("eem" nil "(I\(B")
        ;; ("eec" nil "$B%p(B")
        ;; ("eel" nil "$B%q(B")
        ;; ("eer" nil "$B%u(B")
        ;; ("tte" nil "$B%v(B")
        ("eed" nil "$B"+(B")
        ("eeh" nil "$B"-(B")
        ("eet" nil "$B",(B")
        ("een" nil "$B"*(B")
        ("eew" nil "$B!E(B")
        ("eev" nil "$B!D(B")
        ("eez" nil "$B!&(B")
        ("ee-" nil "$B!A(B")
        ))


;; Local Variables:
;; coding: iso-2022-7bit
;; End:


;; EOF
