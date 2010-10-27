;; modeline.el


;; カーソル位置の文字数を表示
(column-number-mode t)

;; カーソル位置の行数を表示
(line-number-mode t)

;; ;; 時刻表示のフォーマットを指定
;; (setq display-time-string-forms
;;       '((substring year -2) "/"   ; 年は2ケタで
;;         ;; ;; 月と日も強制的に2ケタにしてしまう
;;         ;; (if (< (length month) 2)
;;         ;;     (concat "0" month)
;;         ;;   month)
;;         ;; "/"
;;         ;; (if (< (length day) 2)
;;         ;;     (concat "0" day)
;;         ;;   day)
;;         month "/" day
;;         "(" dayname ")"
;;         ;; " " 24-hours ":" minutes ":" seconds
;;         ))

;; ;; 時刻を表示する
;; (display-time)



;; EOF
