;;; frame.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(defvar jiros-setting-frame-width nil)
(defvar jiros-setting-frame-height nil)


(when (boundp 'window-system)
  ;; デフォルトフレームの設定
  (setq default-frame-alist
        (append (list
                 `(font . ,jiros-setting-font-string)
                 '(foreground-color . "azure3")
                 '(background-color . "black")
                 '(mouse-color . "white")
                 '(cursor-color . "white")
                 `(width . ,(or jiros-setting-frame-width (frame-width)))
                 `(height . ,(or jiros-setting-frame-height (frame-height)))
                 '(top . 0)
                 '(left . 0)
                 '(title . "Emacs")
                 '(frame-cursor-color . "white")
                 )
                default-frame-alist))

  ;; 初期フレームの設定
  (setq initial-frame-alist
        (append
         (list
          '(title . "Initial")
          )
         default-frame-alist))

  ;; ツールバーとメニューバーは消しておく
  (tool-bar-mode -1)
  (menu-bar-mode -1)

  )



;; EOF
