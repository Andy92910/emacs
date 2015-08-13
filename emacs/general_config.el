
;;;self defined key bindings
(global-set-key (kbd "s-2") 'set-mark-command)

(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

(setq default-directory "/Volumes/RAMD/tmp/")

;;; set the default font
(set-default-font "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")

;;; disabl auto-save
(setq auto-save-default nil)


;;; to see http://offbytwo.com/2012/01/15/emacs-plus-paredit-under-terminal.html
;;; key mapping things
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(custom-safe-themes (quote ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "515680472800955f1acfe29597391cb4ca4fc71e3ff59ff4fbd09b2aebba321d" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-compile-window-height 8)
 '(ecb-layout-name "left15")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote (("/Users/andypc/Documents/it dict/os/linux/linux-2.6.18" "/"))))
 '(ecb-tree-indent 2)
 '(global-semantic-show-unmatched-syntax-mode nil nil (semantic-util-modes))
 '(markdown-command "/usr/local/bin/pandoc -f markdown -t html -s -c /usr/local/local_src/pandoc/pandoc_style_template.css")
 '(molokai-theme-kit t)
 '(yas-snippet-dirs (quote ("~/.emacs.d/plugins/yasnippet/snippets" yas-installed-snippets-dir)) nil (yasnippet))
)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (tool-bar-mode -1)
 )
