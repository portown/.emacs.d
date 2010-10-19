;; twitter.el


(require 'twittering-mode)


;; xAuthで認証を行う
(setq twittering-auth-method 'xauth)

;; Twitterのつぶやきフォーマットを指定
(setq twittering-status-format "%i %S(%s)  (%@):\n  %t\n  // from %f %L\n  %r%R")

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

;; ;; 個人設定
;; (load "~/.emacs.d/settings/.twitter")



;; EOF
