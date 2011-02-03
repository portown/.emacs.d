;; skk.el


(require 'skk-autoloads)


;; SKKの初期設定ファイル名
(setq skk-init-file "~/.emacs.d/settings/skk.el")

;; SKKの初期設定ファイルをバイトコンパイルするか否か
(setq skk-byte-compile-init-file t)


;; isearchでSKKを使えるようにする設定

;; isearch開始時設定
(add-hook 'isearch-mode-hook
          #'(lambda ()
              (when (and (boundp 'skk-mode)
                         skk-mode
                         skk-isearch-mode-enable)
                (skk-isearch-mode-setup))))

;; isearch終了時設定
(add-hook 'isearch-mode-end-hook
          #'(lambda ()
              (when (and (featurep 'skk-isearch)
                         skk-isearch-mode-enable)
                (skk-isearch-mode-cleanup))))


;; EOF
