;;; 30_glsl.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/04/12


(autoload 'glsl-mode "glsl-mode" nil t)


(setq auto-mode-alist
      (append
       (list
        '("\\.vert\\'" . glsl-mode)
        '("\\.frag\\'" . glsl-mode)
        )
       auto-mode-alist))



;; EOF
