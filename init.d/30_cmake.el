;;; 30_cmake.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/14


(require 'cmake-mode)


(setq auto-mode-alist
      (append
       '(
         ("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode)
         )
       auto-mode-alist))





;; EOF
