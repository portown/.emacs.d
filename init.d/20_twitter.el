;; twitter.el


(require 'twittering-mode)


;; タイムライン更新間隔（秒）
(defvar jiros-setting-twitter-interval 60)

;; notify中に表示するツイートの最長文字数
(defvar jiros-setting-twitter-notify-max-tweet-length 20)

;; notify中に表示するツイートの最大数
(defvar jiros-setting-twitter-notify-tweet-max 3)


;; oAuthで認証を行う
(setq twittering-auth-method 'oauth)

;; Twitterのつぶやきフォーマットを指定
(setq twittering-status-format "%i %S(%s)  (%@):\n  %t\n  // via %f %L\n  %r%R")

;; ReTweetのフォーマットを指定
(setq twittering-retweet-format "QT @%s: %t")

;; 更新間隔(秒)
(setq twittering-timer-interval jiros-setting-twitter-interval)

;; 公式RTをメインに使用する
(setq twittering-use-native-retweet t)

;; API残量を表示する
(setq twittering-display-remaining t)

;; マスターパスワードを使用する
(setq twittering-use-master-password t)


;; Twittering起動時フック
(add-hook 'twittering-mode-hook
          (lambda ()
            ;; アイコンを表示させる
            (twittering-icon-mode t)

            ;; ;; 公式RTをキーに割り当てる
            ;; (define-key twittering-mode-map "\C-cr" 'twittering-native-retweet)
            ;; ↑C-u twittering-retweet でできる

            ;; ふぁぼり割り当て
            (define-key twittering-mode-map "\C-cf" #'twittering-favorite)
            ))


;; 更新通知
(add-hook 'twittering-new-tweets-hook
          (lambda ()
            (let ((n twittering-new-tweets-count)
                  (statuses twittering-new-tweets-statuses))
              (start-process "twittering-notify" nil "notify-send"
                             "-i" (expand-file-name "~/.emacs.d/elisp/twittering-mode/misc/twitter-icon.svg")
                             ;; "-t" "3000" ; expire time (milliseconds)
                             (format "New %d tweet%s"
                                     n (if (> n 1) "s" ""))
                             (let ((func (lambda (stat)
                                           (concat (cdr (assq 'user-screen-name stat))
                                                   ": "
                                                   (let ((text (cdr (assq 'text stat))))
                                                     (if (> (length text) jiros-setting-twitter-notify-max-tweet-length)
                                                         (concat (substring text 0 jiros-setting-twitter-notify-max-tweet-length) "...")
                                                       text))))))
                               (if (<= n jiros-setting-twitter-notify-tweet-max)
                                   (mapconcat func statuses "\n")
                                 (concat (mapconcat func (butlast statuses (- n jiros-setting-twitter-notify-tweet-max)) "\n")
                                         "\n...")))))))





;; EOF
