;;; autoinsert.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/25


(require 'autoinsert)
(require 'cl)


;; ファイル作成時にテンプレートを自動挿入する
(add-hook 'find-file-not-found-functions 'auto-insert)

;; テンプレートの場所
(setq auto-insert-directory "~/.emacs.d/insert/")

;; テンプレート変数の置換リスト
(defvar jiros-template-var-alist
  `(("file" . ,(lambda () (file-name-nondirectory (buffer-file-name))))
    ("user" . user-full-name)
    ("year" . ,(lambda () (substring (current-time-string) -4)))
    ("time" . ,(lambda () (format-time-string "'%02y/%02m/%02d" (current-time))))
    ;; ("%license%" . (lambda () "GPL"))
    ("uuid" . ,(lambda () (upcase (replace-regexp-in-string "-" "_" (uuid)))))
    ("reg-file" . ,(lambda () (upcase (replace-regexp-in-string "[-. ]" "_"
                                                                (file-name-nondirectory (buffer-file-name))))))
    ))

;; テンプレート変数の置換
(defun jiros-replace-template-var ()
  ;; タイムスタンプを取る
  (time-stamp)

  ;; 置換リストで置換する
  (goto-char (point-min))
  (while (re-search-forward "%\\([^ \t\n\r\f%]+\\)%" nil t)
    (let* ((matched (cdr-safe (assoc-string (match-string 1) jiros-template-var-alist))))
      (when matched
        (replace-match
         (cond
          ((stringp matched) matched)
          ((functionp matched) (funcall matched))
          )))))

  ;; カーソルを指定の位置にセットする
  (goto-char (point-min))
  (if (re-search-forward "[^%]\\(%\\)[^%]" nil t)
      (progn
        (goto-char (match-beginning 1))
        (replace-match "" nil nil nil 1))
    (goto-char (point-min)))

  ;; エスケープされた記号を戻す
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "%%" nil t)
      (replace-match "%")))

  (message "done."))


;; 置換リストの記述を楽にするためのマクロ
(defmacro jiros-template-name (ext)
  `[,(concat "template." `,ext) jiros-replace-template-var])

;; 置換リスト
(setq auto-insert-alist
      `((("\\.c\\'" . "C source")                      . ,(jiros-template-name "c"))
        (("\\.h\\'" . "C header")                      . ,(jiros-template-name "h"))
        (("\\.\\(cpp\\|cxx\\|cc\\)\\'" . "C++ source") . ,(jiros-template-name "cpp"))
        (("\\.\\(hpp\\|hxx\\|hh\\)\\'" . "C++ header") . ,(jiros-template-name "hpp"))
        (("\\.l\\'" . "lex source")                    . ,(jiros-template-name "l"))
        (("\\.y\\'" . "yacc source")                   . ,(jiros-template-name "y"))
        (("\\.ml[ily]?\\'" . "OCaml file")             . ,(jiros-template-name "ml"))
        (("\\.mak\\|Makefile\\.in")                    . ,(jiros-template-name "mak"))
        (("\\.am\\'" . "Automake File")                . ,(jiros-template-name "am"))
        (("Makefile" . "GNU Makefile")                 . ,(jiros-template-name "gnu"))
        (("\\.m4\\'" . "m4 file")                      . ,(jiros-template-name "m4"))
        (("CMakeLists\\.txt\\'" . "CMake file")        . ,(jiros-template-name "cmake"))
        (("\\.cmake\\'" . "CMake file")                . ,(jiros-template-name "cmake"))
        (("\\.lua\\'" . "Lua source")                  . ,(jiros-template-name "lua"))
        (("\\.java\\'" . "Java source")                . ,(jiros-template-name "java"))
        (("\\.scala\\'" . "Scala source")              . ,(jiros-template-name "scala"))
        (("\\.xml\\'" . "XML source")                  . ,(jiros-template-name "xml"))
        (("\\.rnc\\'" . "RELAX NG file")               . ,(jiros-template-name "rnc"))
        (("\\.el\\'" . "Emacs Lisp source")            . ,(jiros-template-name "el"))
        (("\\.tex\\'" . "TeX file")                    . ,(jiros-template-name "tex"))
        (("\\.rb\\'" . "Ruby source")                  . ,(jiros-template-name "rb"))
        (("Rakefile" . "Rake source")                  . ,(jiros-template-name "rb"))
        (("\\.js\\'" . "Javascript source")            . ,(jiros-template-name "js"))
        (("\\.json\\'" . "JSON file")                  . ,(jiros-template-name "js"))
        ))



;; EOF
