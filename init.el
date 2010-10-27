;;; .emacs --- Emacs全体の設定


;; 言語設定
(set-language-environment "Japanese")

;; 起動環境の判定
(load "~/.emacs.d/env")


;; -------------------------------------------------------------
;; オプション
;; -------------------------------------------------------------

(setq user-full-name "YASUDA Jiro")
(setq user-mail-address "jiros@softlab.cs.tsukuba.ac.jp")

(setq jiros-setting-elisp-directory
      '("~/.emacs.d/elisp")
      )

(setq jiros-setting-use-skk-server t)

(setq jiros-setting-font-family "MigMix 1M")
(setq jiros-setting-font-size 11)

(setq jiros-setting-frame-width 99)
(setq jiros-setting-frame-height 69)


;; -------------------------------------------------------------
;; 全体設定
;; -------------------------------------------------------------

;; ;; MSYSのドライブをマウント
;; (when yas-on-Windows
;;   (require 'cygwin-mount)
;;   (setq cygwin-mount-cygwin-bin-directory msys-path)
;;   (setq cygwin-mount-program "msysmnt.exe")
;;   (cygwin-mount-activate))


;; Emacs Lisp読み込みパスを追加
(load "~/.emacs.d/addpath")


;; -------------------------------------------------------------
;; 設定ファイル読み込み
;; -------------------------------------------------------------

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")


;; -------------------------------------------------------------
;; lookup用設定
;; -------------------------------------------------------------

;; (autoload 'lookup "lookup" nil t)
;; (autoload 'lookup-region "lookup" nil t)
;; (autoload 'lookup-pattern "lookup" nil t)

;; ;; 辞書ファイルの設定
;; (setq lookup-search-agents
;; 	  '(
;; 		(ndeb "e:/dic/ASCDATES/")
;; 		(ndeb "e:/dic/EDICT/")
;; 		))


;; ;; -------------------------------------------------------------
;; ;; Opera設定
;; ;; -------------------------------------------------------------

;; (setq browse-url-firefox-program "opera")
;; (setq browse-url-firefox-new-window-is-tab t)
;; (setq browse-url-new-window-flag t)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/opt/google/chrome/google-chrome")



;; EOF
