;;; 02_browser.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/27


(require 'browse-url)


;; 通常使うブラウザをgenericに設定
(setq browse-url-browser-function 'browse-url-generic)

;; genericのプログラムを設定
(setq browse-url-generic-program "/opt/google/chrome/google-chrome")



;; EOF
