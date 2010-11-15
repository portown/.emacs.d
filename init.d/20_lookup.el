;;; 20_lookup.el
;;; Copyright (C) 2010 YASUDA Jiro

;;; Author: YASUDA Jiro
;;; Time:   '10/11/08


(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)



(setq lookup-search-agents
      '(
        (ndtp "localhost")
        (ndict "localhost")
        (ndspell)
        (ndic "/usr/share/edict/")
        (ndic "/usr/share/dict/")
        ))


(setq lookup-enable-splash nil)
(setq lookup-default-method 'prefix)



;; EOF
