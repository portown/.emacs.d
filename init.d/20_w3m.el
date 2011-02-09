;;; w3m.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(autoload 'w3m           "w3m"         "Interface for w3m on Emacs."        t)
(autoload 'w3m-find-file "w3m"         "Find a local file using emacs-w3m." t)
;; (autoload 'w3m-search    "w3m-search"  "Search words using emacs-w3m."      t)
;; (autoload 'w3m-weather   "w3m-weather" "Display a weather report."          t)
;; (autoload 'w3m-antenna   "w3m-antenna" "Report changes of web sites."       t)
;; (autoload 'w3m-namazu    "w3m-namazu"  "Search files with Namazu."          t)
;; (require 'w3m)


(eval-after-load "w3m"
  '(progn
     ;; デフォルトで画像が表示されるように
     (setq w3m-default-display-inline-images t)

     ;; w3mのキーバインディングをinfoに
     (setq w3m-key-binding 'info)

     ;; ;; 地域設定
     ;; (setq w3m-weather-default-area "茨城県・南部")

     ;; ;; サーチエンジンの設定
     ;; (setq w3m-search-default-engine "google-en")

     ;; クッキーを有効に
     (setq w3m-use-cookies t)

     ;; タブを有効に
     (setq w3m-use-tab t)

     ;; ホームページの設定
     (setq w3m-home-page "http://www.google.co.jp/")

     ;; フックの設定
     (add-hook 'w3m-form-input-textarea-mode-hook
               (lambda ()
                 (set-keyboard-coding-system 'euc-japan-unix)
                 ))
     ))





;; EOF
