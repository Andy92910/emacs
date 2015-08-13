

(add-to-list 'load-path "~/.emacs.d/plugins/org-8.2.10/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/org-8.2.10/contrib/lisp")


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

