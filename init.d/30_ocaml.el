;;; ocaml.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/15


(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)


(setq auto-mode-alist
      (append
       (list
        '("\\.ml[ily]?\\'" . tuareg-mode)
        )
       auto-mode-alist))


(add-hook 'tuareg-mode-hook
          #'(lambda ()
              (define-key tuareg-mode-map "\C-m" #'reindent-then-newline-and-indent)
              ))





;; EOF
