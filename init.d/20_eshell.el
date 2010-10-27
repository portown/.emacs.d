;;; 20_eshell.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(require 'eshell)


;; rm *.*で下のディレクトリを消しすぎないように
(setq eshell-glob-include-dot-dot nil)

;; Eshell終了時にヒストリの保存をいちいち聞かないようにする
(setq eshell-save-history-on-exit nil)


;; プロンプトの設定
(setq eshell-prompt-function
      #'(lambda ()
          (concat
           ;; (eshell/pwd)                   ; カレントディレクトリ
           (if (= (user-uid) 0) "#" "$")
           " ")))

;; プロンプトを認識する正規表現の設定
(setq eshell-prompt-regexp "^[#$] ")





;; EOF
