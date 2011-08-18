;;; 30_gnuplot.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/04/08


(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)


(setq auto-mode-alist
      (append
       (list
        '("\\.gp\\'" . gnuplot-mode)
        )
       auto-mode-alist))


;; EOF
