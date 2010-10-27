;;; inithook.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(add-hook 'after-init-hook
          (lambda ()
            (let* ((initial-frame (selected-frame))
                   (main-frame (make-frame (append (list '(title . "Main") '(visibility . t)) default-frame-alist)))
                   (twitter-frame (make-frame (append (list '(title . "Twitter") '(left . 2490) '(width . 67) '(visibility . t)) default-frame-alist)))
                   )

              (delete-frame initial-frame)

              (select-frame twitter-frame)
              (twit)

              (select-frame main-frame)
              )))



;; EOF
