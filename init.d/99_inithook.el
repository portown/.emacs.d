;;; inithook.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(defvar jiros-setting-init-frame-alist-list nil)


(add-hook 'after-init-hook
          #'(lambda ()
              ;; フレーム分割
              ;; (let* ((initial-frame (selected-frame))
              ;;        ;; ;; メインのフレーム
              ;;        ;; (main-frame (make-frame '((title . "Main") (visibility . t))))

              ;;        ;; ;; Twitter用フレーム
              ;;        ;; (twitter-frame (make-frame '((title . "Twitter") (left . 2490) (width . 67) (visibility . t))))
              ;;        )
              (let ((initial-frame (selected-frame)))
                ;; フレームを作成
                (dolist (frame jiros-setting-init-frame-alist-list)
                  (make-frame (cdr (assq 'frame-alist frame))))

                ;; 元のフレームを消す
                (delete-frame initial-frame)

                ;; (select-frame twitter-frame)
                ;; (twit)

                ;; フレーム毎のフック
                (dolist (frame jiros-setting-init-frame-alist-list)
                  (let ((hook (cdr (assq 'after-hook frame))))
                    (run-hooks 'hook)))
                )))



;; EOF
