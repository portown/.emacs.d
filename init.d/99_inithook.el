;;; inithook.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(add-hook 'after-init-hook
          #'(lambda ()
              ;; フレーム分割
              (let* ((initial-frame (selected-frame))
                     ;; メインのフレーム
                     (main-frame (make-frame '((name . "Main") (visibility . t))))

                     ;; Twitter用フレーム
                     (twitter-frame (make-frame '((name . "Twitter") (visibility . t))))
                     )
                ;; 元のフレームを消す
                (delete-frame initial-frame)

                (select-frame twitter-frame)
                (twit)

                ;; メインのフレームを選択
                (select-frame main-frame)
                )
              ))



;; EOF
