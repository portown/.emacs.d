;;; settings.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


;; バックアップファイルを作る
(setq make-backup-files t)

;; 初期画面(Meadowロゴ)は表示しない
(setq inhibit-startup-message t)

;; タブ幅を2に
(setq-default tab-width 2)
(setq-default tab-stop-list
              '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36
                  38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68
                  70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100
                  102 104 106 108 110 112 114 116 118 120))

;; タブではなくスペースを使う
(setq-default indent-tabs-mode nil)

;; 文字に色を付ける
(global-font-lock-mode t)

;; 対応するカッコに色を付ける
(show-paren-mode t)

;; リージョンを色付けする
(setq transient-mark-mode t)

;; 右端で折り返すようにする
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; GUDを利用する
(setq gdb-many-windows t)

;; シェルの設定
(setq explicit-shell-file-name "bash")
(setq shell-file-name "bash")
(setq shell-command-switch "-c")

;; スクロールバーを表示しない
(set-scroll-bar-mode nil)

;; キルリングとクリップボードを同一化する
(setq x-select-enable-clipboard t)



;; EOF
