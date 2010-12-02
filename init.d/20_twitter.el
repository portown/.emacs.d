;; twitter.el


(require 'twittering-mode)


;; oAuthで認証を行う
(setq twittering-auth-method 'oauth)

;; Twitterのつぶやきフォーマットを指定
(setq twittering-status-format "%i %S(%s)  (%@):\n  %t\n  // via %f %L\n  %r%R")

;; ReTweetのフォーマットを指定
(setq twittering-retweet-format "RT @%s: %t")

;; 更新間隔(秒)
(setq twittering-timer-interval 60)

;; Twittering起動時フック
(add-hook 'twittering-mode-hook
          #'(lambda ()
              ;; アイコンを表示させる
              (twittering-icon-mode t)

              ;; 公式RTをキーに割り当てる
              (define-key twittering-mode-map "\C-cr" 'twittering-native-retweet)

              ;; ふぁぼり割り当て
              (define-key twittering-mode-map "\C-cf" 'twittering-favorite)
              ))

;; マスターパスワードを使用する
(setq twittering-use-master-password t)

;; 更新通知
(add-hook 'twittering-new-tweets-hook
          #'(lambda ()
              (let ((n twittering-new-tweets-count))
                (start-process "twittering-notify" nil "notify-send"
                               "-i" "/usr/share/pixmaps/gnome-emacs.png"
                               "New tweets"
                               (format "You have %d new tweet%s"
                                       n (if (> n 1) "s" ""))))))





;; EOF
