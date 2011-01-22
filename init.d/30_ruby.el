;;; ruby.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(require 'ruby-electric)


(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


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

              ;; Don't want flymake mode for ruby regions in rhtml files
              (if (not (null buffer-file-name))
                  (flymake-mode))
              ))





;; EOF
