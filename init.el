;;; .emacs --- Emacs全体の設定


;; 言語設定
(set-language-environment "Japanese")

;; 設定の読み込み
(load "~/.emacs.d/settings")


;; -------------------------------------------------------------
;; 全体設定
;; -------------------------------------------------------------

;; ;; MSYSのドライブをマウント
;; (when jiros-on-Windows
;;   (require 'cygwin-mount)
;;   (setq cygwin-mount-cygwin-bin-directory msys-path)
;;   (setq cygwin-mount-program "msysmnt.exe")
;;   (cygwin-mount-activate))


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





;; EOF
