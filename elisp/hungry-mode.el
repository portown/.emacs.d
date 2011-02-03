;;; hungry-mode.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/03


(defvar hungry-mode-map
  (easy-mmode-define-keymap
   (list
    '([backspace] . hungry-electric-backspace)
    '([delete]    . hungry-electric-delete)
    '("\C-d"      . hungry-electric-delete)
    )
   "hungry-mode-map" nil))


;;;###autoload
(define-minor-mode hungry-mode
  "Toggle Hungry mode.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When Hungry Delete mode is enabled, the delete key
gobbles all preceding whitespace except the last.
See the command \\[hungry-electric-delete]."
  :init-value nil
  :global nil
  :keymap hungry-mode-map
  :lighter " hungry"
  )


;; カーソル位置より前方の空白を全て削除
;; c-electric-backspace相当
;; 参考元：http://d.hatena.ne.jp/soutaro/20060724/1153764571
(defun hungry-electric-backspace ()
  "Deletes preceding character or all whitespaces."
  (interactive)
  (let ((here (point)))
    (skip-chars-backward " \t\n\r\f\v")
    (if (/= (point) here)
        (delete-region (point) here)
      (delete-backward-char 1))))

;; カーソル位置より後方の空白を全て削除
;; c-electric-delete-forward相当
;; 参考元：http://d.hatena.ne.jp/soutaro/20060724/1153764571
(defun hungry-electric-delete ()
  "Deletes following character or all white spaces."
  (interactive)
  (let ((here (point)))
    (skip-chars-forward " \t\n\r\f\v")
    (if (/= (point) here)
        (delete-region (point) here)
      (delete-char 1))))


(provide 'hungry-mode)


;; EOF
