;; keybind.el


;; 改行と同時にインデントする
(define-key global-map "\C-m" 'newline-and-indent)

;; C-hでバックスペース
(global-set-key "\C-h" [backspace])

;; M-hで単語単位バックスペース
(defun kill-backward-word (n)
  "Kill characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."

  (interactive "p")
  (kill-region (point) (progn (forward-word (- n)) (point))))
(global-set-key "\M-h" #'kill-backward-word)

;; M-<やM->でマークをセットしない
(global-set-key "\M-<"
                (lambda ()
                  (interactive)
                  (goto-char (point-min))))
(global-set-key "\M->"
                (lambda ()
                  (interactive)
                  (goto-char (point-max))))

;; C-,やC-.でウィンドウ移動
(global-set-key [?\C-,]
                (lambda ()
                  (interactive)
                  (set-frame-selected-window nil (previous-window))))
(global-set-key [?\C-.]
                (lambda ()
                  (interactive)
                  (set-frame-selected-window nil (next-window))))

;; ;; ウィンドウセットの変更
;; (global-set-key "\C-cp" 'win-prev-window)
;; (global-set-key "\C-cn" 'win-next-window)

;; SKK
(global-set-key "\C-\\" 'skk-mode)

;; コンパイル
(global-set-key "\C-cm" 'compile)

;; magit-statusを起動
(global-set-key "\C-cg" 'magit-status)

;; sdicの設定
(global-set-key "\C-cw" 'sdic-describe-word)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)



;; EOF
