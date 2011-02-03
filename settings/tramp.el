;;; tramp.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/10/30


(require 'tramp)


;; TRAMPのデフォルトメソッド
(setq tramp-default-method "ssh")


;; ;; ホスト毎のデフォルトユーザの設定
;; ;; (METHOD HOST USER) の形
;; (setq tramp-default-user-alist
;;       (list
;;        '("ssh" "\\`portown\\.dyndns\\.org\\'" "kou")
;;        ))


;; プロクシ設定
(setq tramp-default-proxies-alist
      (list
       '("\\`orion\\'" "\\`root\\'" "/ssh:%h:")
       ))


;; EOF
