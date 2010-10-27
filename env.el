;;; env.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


;; OSを判定

;; GNU/Linux上で動作
(defconst yas-on-GNU-Linux
  (equal system-type 'gnu/linux))

;; SunOS上で動作
(defconst yas-on-SunOS
  (equal system-type 'berkeley-unix))

;; Solaris上で動作
(defconst yas-on-Solaris
  (equal system-type 'usg-unix-v))

;; UNIX上で動作
(defconst yas-on-UNIX
  (or
   yas-on-GNU-Linux
   yas-on-SunOS
   yas-on-Solaris
   ))

;; Windows上で動作
(defconst yas-on-Windows
  (equal system-type 'windows-nt))

;; Mac OS X上で動作
(defconst yas-on-MacOSX
  (equal system-type 'darwin))

;; Mac上で動作
(defconst yas-on-Mac
  (or
   yas-on-MacOSX
   ))


;; 判定できなかった
(unless
    (or
     yas-on-UNIX
     yas-on-Windows
     yas-on-Mac
     )
  (message "Unknown system-type"))


;; ウィンドウシステムを判定

;; X Window System
(defconst yas-x
  (equal window-system 'x))

;; Meadow
(defconst yas-w32
  (equal window-system 'w32))

;; Mule for Win32
(defconst yas-win32
  (equal window-system 'win32))

;; Mac OS X
(defconst yas-mac
  (equal window-system 'mac))


;; 判定できなかった
(unless
    (or
     yas-x
     yas-w32
     yas-win32
     yas-mac
     )
  (message "Unknown window-system"))


;; Meadow
(defconst yas-Meadow
  (featurep 'meadow))





;; EOF
