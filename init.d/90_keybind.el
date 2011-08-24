;; keybind.el


;; 改行と同時にインデントする
(global-set-key "\C-m" #'newline-and-indent)

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

;; shell-command-on-region を自動化
(global-set-key "\M-!" #'shell-command-dwim)

;; SKK
(global-set-key "\C-\\" #'skk-mode)

;; コンパイル
(global-set-key "\C-cm" #'compile)

;; magit-statusを起動
(global-set-key "\C-cg" #'magit-status)

;; sdicの起動
(global-set-key "\C-cw" #'sdic-describe-word)
(global-set-key "\C-cW" #'sdic-describe-word-at-point)

;; lookupの起動
(global-set-key "\C-cl" #'lookup-pattern)

;; flymakeのエラー表示
(global-set-key "\C-cd" #'credmp/flymake-display-err-minibuf)

;; hideshow のトグル
(global-set-key "\C-ct" #'hs-toggle-hiding)


;; EOF
