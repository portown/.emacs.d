;;; addpath.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/09/08


;; ELisp読み込みパスを追加
(defvar jiros-setting-elisp-directory '())

;; (dolist
;;     (dir
;;      (let ((dir (expand-file-name jiros-setting-elisp-directory)))
;;        (list dir (format "%s%d" dir emacs-major-version))))
;;   (when (and (stringp dir) (file-directory-p dir))
;;     (let ((default-directory dir))
;;       (setq load-path (cons default-directory load-path))
;;       (normal-top-level-add-subdirs-to-load-path))))
(dolist (dir jiros-setting-elisp-directory)
  (when (and (stringp dir) (file-directory-p dir))
    (let ((default-directory dir))
      (setq load-path (cons default-directory load-path))
      (normal-top-level-add-subdirs-to-load-path))))





;; EOF
