;; dired.el


(require 'dired-x)
(require 'wdired)


;; ディレクトリを先に表示する
(setq ls-lisp-dirs-first t)

;; ディレクトリの再帰的移動と再帰的削除に確認をとらない
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; ファイルごとにデフォルトコマンドを設定する
(setq dired-guess-shell-alist-user
      '(("\\.tar\\.gz\\'" "tar -xzf")
        ("\\.tar\\.bz2\\'" "tar -xjf")
        ("\\.tar\\.lzma\\'" "tar --lzma -xf")
        ("\\.zip\\'" "unzip -q")
        ))

;; キー設定
(add-hook 'dired-mode-hook
          #'(lambda ()
              ;; dired バッファを直接編集する
              (define-key dired-mode-map "\C-cr" 'wdired-change-to-wdired-mode)
              ))


;; -----------------------------------------------------------------------------
;; ディレクトリを開く／上のディレクトリへ移動 の際、バッファを増やさない処理
;; -----------------------------------------------------------------------------

;; ディレクトリを開く場合
(defadvice dired-find-file (around kill-dired-buffer activate)
  (let ((before (current-buffer)))
    ad-do-it
    (when (eq major-mode 'dired-mode)
      (kill-buffer before))))

;; 上のディレクトリへ移動する場合
(defadvice dired-up-directory (around kill-up-dired-buffer activate)
  (let ((before (current-buffer)))
    ad-do-it
    (when (eq major-mode 'dired-mode)
      (kill-buffer before))))



;; EOF
