;; -*- coding: iso-2022-jp -*-
;; SKK $B$G7nG[Ns$r;H$&!#(B
;; [YK] massangeana$B;a$N2VG[Ns$N(BEmacs Lisp$B$r7nG[NsMQ$K2~JQ!#(B
;;      (see http://www.massangeana.com/mas/charsets/hana/hanasetup.htm#skk)
;;      $B%3%a%s%HCf$N(B [YK] $B$O2~JQ<T$K$h$kIU5-$rI=$9!#(B
;;
;; $BCm0U(B: daredevil SKK + NICOLA-DDSKK $B$,%$%s%9%H!<%k$5$l$F$$$k$3$H$r(B
;; $BA0Ds$H$7$F$$$k!#(Bskk-kanagaki-dakuten, skk-kanagaki-handakuten $B$,(B
;; $B$"$l$P(B daredevil SKK $B$OI,MW$J$$$,!#(B

;; (when (not (boundp 'skk-hana-ansi)) (setq skk-hana-ansi nil))

(require 'skk-vars)
;; (require 'skk-autoloads)
;; (require 'skk-kanagaki-util)

(setq skk-special-midashi-char-list '(?[ ?]))

;; skk-auto-start-henkan-keyword-list $B$O$=$N$^$^$G$h$$!#(B

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

;; `-' $B$GA08uJd$rI=<(!#(B
(setq skk-previous-candidate-char ?=)  ;; [YK] `=' $B$KJQ99$7$?!#(B

(setq skk-process-okuri-early nil)  ; $B%m!<%^;zJQ49$N;~0J30$O0UL#$J$7!#(B


;; ;; copied from skk-kanagaki.el

;; (defun skk-kanagaki-set-okurigana (&optional no-sokuon)
;;   "$B%]%$%s%H$ND>A0$NJ8;z$rAw$j2>L>$H8+Jo$7$F!"JQ49$r3+;O$9$k!#(B
;; $B$?$@$7!"(B $B$b$&$R$H$DA0$NJ8;z$,B%2;$@$C$?>l9g$K$O!"(B $B$=$l0J9_$rAw$j2>L>$H8+Jo$9!#(B"
;;   (interactive)
;;   (let ((pt1 (point))
;;         pt2 okuri sokuon)
;;     (setq okuri
;;           (skk-save-point
;;            ;; $B$&$&!"$3$s$J$3$H$r$7$J$1$l$P$J$i$J$$$N$+(B...
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
;;         (unless (member sokuon '("$B$C(B" "$B%C(B"))
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
;;   "$B"#%b!<%I$H"'%b!<%I$G$O(B latin-mode $B$K0\9T$9$k!#(B
;; $B"&%b!<%I$G$OByE@$rDI2C$7!"@hF,$N0l;z0J30$G$OByE@$rDI2C$7$?2>L>$r(B
;; $BAw$j2>L>3+;OJ8;z$H$_$J$7$FJQ49$r3+;O$9$k!#(B"
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
        ("Q" nil skk-set-henkan-point-subr)  ;; [YK] $B2V$G$O(B Q
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

        ("'" nil ("$B%j(B" . "$B$j(B"))   ("t'" nil ("$B%!(B" . "$B$!(B"))   ("n'" nil "$B!*(B")
        ("," nil ("$B%3(B" . "$B$3(B"))   ("t," nil ("$B%c(B" . "$B$c(B"))   ("n," nil ("$B%4(B" . "$B$4(B"))
        ("." nil ("$B%7(B" . "$B$7(B"))   ("t." nil ("$B%M(B" . "$B$M(B"))   ("n." nil ("$B%8(B" . "$B$8(B"))
        ("p" nil ("$B%F(B" . "$B$F(B"))   ("tp" nil ("$B%i(B" . "$B$i(B"))   ("np" nil ("$B%G(B" . "$B$G(B"))
        ("y" nil ("$B%g(B" . "$B$g(B"))   ("ty" nil ("$B%a(B" . "$B$a(B"))
        ("f" nil ("$B%D(B" . "$B$D(B"))   ("ef" nil ("$B%L(B" . "$B$L(B"))   ("of" nil ("$B%E(B" . "$B$E(B"))
        ("g" nil ("$B%s(B" . "$B$s(B"))   ("eg" nil ("$B%`(B" . "$B$`(B"))   ("og" nil ("$B%T(B" . "$B$T(B"))
        ("c" nil ("$B%$(B" . "$B$$(B"))   ("ec" nil ("$B%_(B" . "$B$_(B"))   ("oc" nil ("$B%](B" . "$B$](B"))
        ("r" nil ("$B%+(B" . "$B$+(B"))   ("er" nil ("$B%((B" . "$B$((B"))   ("or" nil ("$B%,(B" . "$B$,(B"))
        ("l" nil ("$B!<(B" . "$B!<(B"))   ("el" nil ("$B%'(B" . "$B$'(B"))   ("ol" nil "$B!)(B")

        ("a" nil ("$B%O(B" . "$B$O(B"))   ("ta" nil ("$B%#(B" . "$B$#(B"))   ("na" nil ("$B%P(B" . "$B$P(B"))
                                  ("to" nil ("$B%h(B" . "$B$h(B"))   ("no" nil ("$B%Q(B" . "$B$Q(B"))
                                  ("te" nil ("$B%1(B" . "$B$1(B"))   ("ne" nil ("$B%2(B" . "$B$2(B"))
        ("u" nil ("$B%H(B" . "$B$H(B"))   ("tu" nil ("$B%"(B" . "$B$"(B"))   ("nu" nil ("$B%I(B" . "$B$I(B"))
        ("i" nil ("$B%?(B" . "$B$?(B"))   ("ti" nil ("$B%l(B" . "$B$l(B"))   ("ni" nil ("$B%@(B" . "$B$@(B"))
        ("d" nil ("$B%/(B" . "$B$/(B"))   ("ed" nil ("$B%^(B" . "$B$^(B"))   ("od" nil ("$B%0(B" . "$B$0(B"))
        ("h" nil ("$B%&(B" . "$B$&(B"))   ("eh" nil ("$B%*(B" . "$B$*(B"))   ("oh" nil ("$B%t(B" . "$B%t(B"))
                                  ("et" nil ("$B%[(B" . "$B$[(B"))   ("ot" nil ("$B%\(B" . "$B$\(B"))
                                  ("en" nil ("$B%=(B" . "$B$=(B"))   ("on" nil ("$B%>(B" . "$B$>(B"))
        ("s" nil ("$B%-(B" . "$B$-(B"))   ("es" nil ("$B%)(B" . "$B$)(B"))   ("os" nil ("$B%.(B" . "$B$.(B"))
        ("-" nil ("$B%A(B" . "$B$A(B"))   ("e-" nil "$B!'(B")            ("o-" nil ("$B%B(B" . "$B$B(B"))

        (";" nil ("$B%9(B" . "$B$9(B"))   ("t;" nil ("$B%%(B" . "$B$%(B"))   ("n;" nil ("$B%:(B" . "$B$:(B"))
        ("q" nil ("$B%r(B" . "$B$r(B"))   ("tq" nil ("$B%d(B" . "$B$d(B"))
        ("j" nil ("$B%K(B" . "$B$K(B"))   ("tj" nil ("$B%;(B" . "$B$;(B"))   ("nj" nil ("$B%<(B" . "$B$<(B"))
        ("k" nil ("$B%J(B" . "$B$J(B"))   ("tk" nil ("$B%e(B" . "$B$e(B"))
        ("x" nil ("$B%5(B" . "$B$5(B"))   ("tx" nil ("$B%f(B" . "$B$f(B"))   ("nx" nil ("$B%6(B" . "$B$6(B"))
        ("b" nil ("$B%C(B" . "$B$C(B"))   ("eb" nil ("$B%R(B" . "$B$R(B"))   ("ob" nil ("$B%S(B" . "$B$S(B"))
        ("m" nil ("$B%k(B" . "$B$k(B"))   ("em" nil ("$B%o(B" . "$B$o(B"))   ("om" nil ("$B%W(B" . "$B$W(B"))
        ("w" nil ("$B%N(B" . "$B$N(B"))   ("ew" nil ("$B%U(B" . "$B$U(B"))   ("ow" nil ("$B%V(B" . "$B$V(B"))
        ("v" nil ("$B%b(B" . "$B$b(B"))   ("ev" nil ("$B%m(B" . "$B$m(B"))   ("ov" nil ("$B%Z(B" . "$B$Z(B"))
        ("z" nil ("$B%X(B" . "$B$X(B"))   ("ez" nil "$B!?(B")            ("oz" nil ("$B%Y(B" . "$B$Y(B"))

        ("e[" nil "$B!V(B")
        ("e]" nil "$B!W(B")
        ("ee[" nil "$B!X(B")
        ("ee]" nil "$B!Y(B")
        ("(" nil "$B!J(B")
        (")" nil "$B!K(B")
        ("[" nil "$B!N(B")
        ("]" nil "$B!O(B")
        ("{" nil "$B!P(B")
        ("}" nil "$B!Q(B")
        ("tt," nil "$B!c(B")
        ("tt." nil "$B!d(B")
        ("\\" nil "$B!@(B")
        ("ee\\" nil "$B!o(B")
        ("eem" nil ("$B%n(B" . "$B$n(B"))
        ("eec" nil ("$B%p(B" . "$B$p(B"))
        ("eel" nil ("$B%q(B" . "$B$q(B"))
        ("eer" nil "$B%u(B")
        ("tte" nil "$B%v(B")
        ("eed" nil "$B"+(B")
        ("eeh" nil "$B"-(B")
        ("eet" nil "$B",(B")
        ("een" nil "$B"*(B")
        ("eew" nil "$B!E(B")
        ("eev" nil "$B!D(B")
        ("eez" nil "$B!&(B")
        ("ee-" nil "$B!A(B")
        ))

(load "skk-tsukiux-dvorak-jisx0201")


;; EOF
