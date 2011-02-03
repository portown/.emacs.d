;;; .emacs --- Emacs全体の設定


;; 言語設定
(set-language-environment "Japanese")

;; 起動環境の判定
(load "~/.emacs.d/env")

;; 設定の読み込み
(load "~/.emacs.d/settings")


;; -------------------------------------------------------------
;; 全体設定
;; -------------------------------------------------------------

;; Emacs Lisp読み込みパスを追加
(load "~/.emacs.d/addpath")


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


;; EOF
