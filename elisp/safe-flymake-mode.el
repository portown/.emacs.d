;;; safe-flymake-mode.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/17


;; 安全にflymakeさせる
(defun safe-flymake-mode ()
  (if (and (not noninteractive)
           (not (null buffer-file-name)))
      (flymake-mode 1)))


(provide 'safe-flymake-mode)


;; EOF
