;; .mew.el


(setq mew-use-master-passwd t)

(setq mew-name "YASUDA Jiro")
(setq mew-user "jiros")

(setq mew-mail-domain "softlab.cs.tsukuba.ac.jp")

(setq mew-smtp-user "jiros")
(setq mew-smtp-auth-list
      '("CRAM-MD5" "LOGIN" "PLAIN"))
(setq mew-smtp-server "mail.softlab.cs.tsukuba.ac.jp")
(setq mew-smtp-port 25)

(setq mew-proto "%")
(setq mew-imap-user "jiros")
(setq mew-imap-server "mail.softlab.cs.tsukuba.ac.jp")

(setq mew-print-function 'ps-print-buffer)

;; (setq mew-mailbox-type 'mbox)
;; (setq mew-mbox-command "incm")
;; (setq mew-mbox-command-arg "-u -d ~/.mbox")


;; EOF
