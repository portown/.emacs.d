;;; mew.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)


(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Emacsのメール送信クライアントに設定
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))





;; EOF
