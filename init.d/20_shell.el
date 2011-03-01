;;; 20_shell.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/02/24


(require 'shell-command)


;; シェルの設定
(eval-after-load "shell"
  '(progn
     (setq explicit-shell-file-name "bash")
     (setq shell-file-name "bash")
     (setq shell-command-switch "-c")
     ))


;; リージョンのあるなしで shell-command と shell-command-on-region を切り替える
;; 引用: http://www.bookshelf.jp/soft/meadow_45.html#SEC681
(defun shell-command-dwim (command &optional arg)
  "Execute string COMMAND in inferior shell; insert the COMMAND's output
at point.  If the mark is active, exexute COMMAND with region as input;
replace the region with the COMMAND's output.
With prefix argument, insert the COMMAND's output after the region
instead of replacing."
  (interactive
   (list
    ;; shell-command.el による補完機能を利用
    (if (and (featurep 'shell-command) shell-command-completion-mode)
        (shell-command-read-minibuffer shell-command-prompt
                                       default-directory
                                       nil nil nil 'shell-command-history)
      (read-from-minibuffer "Shell command: "))
    current-prefix-arg))
  (if mark-active
      (progn
        (if arg
            (progn
              (command-execute 'copy-region-as-kill) ; Duplicate region
              (goto-char (max (point) (mark)))
              (newline 2)
              (yank)))
        (shell-command-on-region
         (region-beginning) (region-end) command t t))
    (shell-command command t))
  (goto-char (max (point) (mark t)))
  (if (= (point) (point-at-bol))
      (delete-backward-char 1)))


;; EOF
