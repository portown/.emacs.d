;;; c++.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'cc-mode)


;; スタイル作成
(defconst jiros-c-style
  '(
    ;; インデントにスペースを使う
    (indent-tabs-mode . nil)
    ;; タブキーの幅
    (tab-width . 2)
    ;; 基本インデント
    (c-basic-offset . 2)
    ;; コメント行のインデント
    (c-comment-only-line-offset . (0 . 0))
    ;; 細かいインデント
    (c-offsets-alist
     . ((statement-block-intro . +)     ; ブロックの'{'の後
        (knr-argdecl-intro . +)         ; K&Rスタイルでの引数定義
        (substatement-open . 0)         ; '{'の前
        (statement-case-open . +)       ; case文の中のブロックの開始
        (statement-cont . +)            ; 文の継続行
        (label . 0)                     ; ラベル
        (case-label . +)                ; case文のラベル
        (inline-open . 0)               ; クラス内関数定義
        (inexpr-class . 0)              ; ???
        (arglist-intro . c-lineup-arglist-intro-after-paren)
                                        ; 引数リストの開始
        (arglist-close . c-lineup-arglist)
                                        ; 引数リストの終了
        (arglist-cont-nonempty . c-lineup-arglist)
                                        ; 引数リストの最初の行に要素があるときの2行目
        (arglist-cont . +)              ; 引数リストの最初の行に要素がないときの2行目
        (block-open . 0)                ; ブロックの開始
        (member-init-intro . +)         ; メンバイニシャライザの先頭
        (brace-list-open . 0)           ; 初期化リストやenumの'{'
        ))
    ;; 括弧前後の改行設定
    (c-hanging-braces-alist
     . ((class-open before after)          ; クラス定義の'{'
        (class-close)                      ; クラス定義の'}'
        (defun-open before after)          ; 関数定義の'{'
        (defun-close after)                ; 関数定義の'}'
        (inline-open before after)         ; クラス内関数定義の'{'
        (inline-close after)               ; クラス内関数定義の'}'
        (brace-list-open)                  ; 初期化リストやenumの'{'
        (brace-list-close)                 ; 初期化リストやenumの'}'
        (brace-entry-open before after)    ; ???
        (statement before after)           ; ???
        (substatement-open before after)   ; 制御文の'{'
        (statement-case-open before after) ; case文の中の'{'
        (block-open before after)          ; ブロック内のブロックの'{'
        (block-close before after)         ; ブロック内のブロックの'}'
        (extern-lang-open before after)    ; 他言語リンケージの'{'
        (extern-lang-close after)          ; 他言語リンケージの'}'
        (else-clause before after)         ; ???
        ))
    ;; コロン前後の改行設定
    (c-hanging-colons-alist
     . ((case-label after)              ; case
        (label after)                   ; ラベル
        (access-label after)            ; アクセス指定子
        (member-init-intro before)      ; メンバイニシャライザ
        (inher-intro before)            ; 継承リスト
        ))
    ;; 余計な空白文字のキャンセル設定
    (c-cleanup-list
     . (defun-close-semi                ; クラス定義後の'}'と';'の間
         scope-operator                 ; スコープ演算子の':'と':'の間
         ))
    ;; ???
    (c-special-indent-hook . c-gnu-impose-minimum)
    ;; ???
    (c-block-comment-prefix . " ")
    ))

;; フック設定
(add-hook 'c-mode-common-hook
          (lambda ()
            ;; 作成したスタイルを設定
            (c-add-style "jiros-c-style" jiros-c-style t)

            ;; エレクトリック機能を設定
            (c-toggle-auto-newline 1)   ; 改行が自動挿入される
            (c-toggle-hungry-state 1)   ; 空白が一気に削除される
            ))

;; 拡張子の関連付け
(setq auto-mode-alist
      (append
       (list
        '("\\.cxx\\'" . c++-mode)
        '("\\.hxx\\'" . c++-mode))
       auto-mode-alist))



;; EOF
