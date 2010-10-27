;;; 20_compile.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


;; メイクコマンドの設定
(setq compile-command "make")

;; メイク時に自動で保存する
(setq compilation-ask-about-save nil)


(defvar jiros-compilation-window-height 10
  "height of window of *compilation* buffer")

(defconst jiros-compilation-buffer-name "*compilation*"
  "the name of compilation buffer")

;; 自前compilation関数 (windowを固定化する)
;; http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-comp.html より抜粋、ちょこちょこ変更
(defadvice compile (before jiros-open-buffer-before-compile)
  "compileの前に*compilation*バッファをオープンする"
  (let ((com-buffer (get-buffer-create jiros-compilation-buffer-name)))
    (unless (get-buffer-window com-buffer)
      (let ((com-window (split-window-vertically (- jiros-compilation-window-height))))
        (set-window-buffer com-window com-buffer)))))



;; EOF
