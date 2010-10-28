;;; env.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/08/31


;; OSを判定

;; GNU/Linux上で動作
(defconst jiros-on-GNU-Linux
  (eq system-type 'gnu/linux))

;; SunOS上で動作
(defconst jiros-on-SunOS
  (eq system-type 'berkeley-unix))

;; Solaris上で動作
(defconst jiros-on-Solaris
  (eq system-type 'usg-unix-v))

;; UNIX上で動作
(defconst jiros-on-UNIX
  (or
   jiros-on-GNU-Linux
   jiros-on-SunOS
   jiros-on-Solaris
   ))

;; Windows上で動作
(defconst jiros-on-Windows
  (eq system-type 'windows-nt))

;; Mac OS X上で動作
(defconst jiros-on-MacOSX
  (eq system-type 'darwin))

;; Mac上で動作
(defconst jiros-on-Mac
  (or
   jiros-on-MacOSX
   ))


;; 判定できなかった
(unless
    (or
     jiros-on-UNIX
     jiros-on-Windows
     jiros-on-Mac
     )
  (message "Unknown system-type"))


;; ウィンドウシステムを判定

;; X Window System
(defconst jiros-x
  (eq window-system 'x))

;; Meadow
(defconst jiros-w32
  (eq window-system 'w32))

;; Mule for Win32
(defconst jiros-win32
  (eq window-system 'win32))

;; Mac OS X
(defconst jiros-mac
  (eq window-system 'mac))


;; 判定できなかった
(unless
    (or
     jiros-x
     jiros-w32
     jiros-win32
     jiros-mac
     )
  (message "Unknown window-system"))


;; Meadow
(defconst jiros-Meadow
  (featurep 'meadow))





;; EOF
