;;; ruby.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(require 'ruby-electric)


(setq auto-mode-alist
      (append
       (list
        '("\\.rb\\'" . ruby-mode)
        '("Rakefile" . ruby-mode))
       auto-mode-alist))

(add-hook 'ruby-mode-hook
          #'(lambda ()
              (define-key ruby-mode-map "\C-m" 'reindent-then-newline-and-indent)
              (define-key ruby-mode-map "\C-c\C-c" 'comment-region)

              (ruby-electric-mode t)
              (setq ruby-electric-expand-delimiters-list nil)

              (require 'ruby-block)
              (ruby-block-mode t)
              (setq ruby-block-highlight-toggle t)
              ))





;; EOF
