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
  (let* ((cur-window (selected-window))
         (com-buffer (get-buffer jiros-compilation-buffer-name)))
    (when (null com-buffer)
      (setq com-buffer (get-buffer-create jiros-compilation-buffer-name)))
    (let ((com-window (get-buffer-window com-buffer)))
      (if com-window
          (select-window com-window)
        (select-window
         (split-window (selected-window) (- (window-height) jiros-compilation-window-height) nil)))
      (switch-to-buffer com-buffer)
      (select-window cur-window))))





;; EOF
