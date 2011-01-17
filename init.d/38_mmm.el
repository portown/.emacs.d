;;; 38_mmm.el
;;; Copyright (C) 2011 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '11/01/14


;; autoloadさせたい場合は以下
(require 'mmm-auto)
;; 起動時に全てロードさせたい場合は以下
;; (require 'mmm-mode)


;; mmm-modeの使用タイミング
(setq mmm-global-mode
      ;; 常に使いたい場合
      t
      ;; 自動では使いたくない場合
      ;; nil
      ;; 自動で判別させたい場合
      ;; 'maybe                            ; tでもnilでもなければなんでもいい
      )


;; mmm-modeにしたくないメジャーモード
(setq mmm-never-modes
      (append
       '(
         twittering-mode
         twittering-edit-mode
         compilation-mode
         woman-mode
         magit-mode
         magit-log-edit-mode
         )
       mmm-never-modes))


;; submodeの装飾レベル
;; 0: 通常のfont-lockに準じる
;; 1: submode中のfaceを一律に変更する
;; 2: submode中のfaceを様々に変更する

(setq mmm-submode-decoration-level 1)

;; decoration-level: 1 のときに使用されるface
(set-face-background 'mmm-default-submode-face "gray15")


;; mmm-modeで常に使用するサブクラス

(setq mmm-global-classes
      (append
       '(
         file-variables                 ; mmm-mode付属。ファイル末尾の"Local Variables:"に反応
         )
       mmm-global-classes))


;; mmm-modeを使用するファイルパターンとモードを指定
;; （mmm-global-modeがnon-nilの場合のみ）
;;
;; (mmm-add-mode-ext-class MODE EXTENSION CLASS)
;; MODEとEXTENSIONはnilを指定するとワイルドカード

(mmm-add-mode-ext-class nil "\\.s?html?\\'" 'embedded-css) ; mmm-mode付属。CSS in HTML
(mmm-add-mode-ext-class nil "\\.php?\\'" 'jiros-html-php)


;; サブクラスの記述

;; PHP in HTML
(mmm-add-classes
 '((jiros-html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>"))
 )


;; EOF
