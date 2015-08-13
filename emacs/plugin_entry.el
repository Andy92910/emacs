
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.1.3")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

(setq inhibit-startup-screen 1)

;;highlight nonselecting window
(setq highlight-nonselected-windows 1)

;;use logical lines when moving cursor
(setq line-move-visual 1)

;;c-n c-p will track the semipermanent position
(setq track-eol 1)

;; Setup load-path and autoloads
;;(add-to-list 'load-path "/opt/slime")
;;(require 'slime-autoloads)

;(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")

;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-robin-hood)

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete//ac-dict")
(ac-config-default)


(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; Set your lisp system and, optionally, some contribs
;;(setq inferior-lisp-program "/opt/cmucl/bin/lisp")
;;(setq slime-contribs '(slime-fancy))
  ;;; Emacs Load Path
;;(setq load-path (cons "~/Documents/emacs" load-path))

;;(add-to-list 'load-path "/usr/local/bin/cscope")
;;(require 'xcscope)
;;(setq cscope-do-not-update-database t)

;;set indent when pressing enter
;(add-hook 'lisp-mode-hook '(lambda ()
;  (local-set-key (kbd "RET") 'newline-and-indent)))

;(require 'zjl-hl)
;(zjl-hl-enable-global-all-modes)

;;(setq user-full-name "Andy")
;;(setq user-mail-address "zhangshichao_andy@hotmail.com")

(defun indent-buffer()
  "indent the whole buffer"
  (interactive)
  (save-excursion
   (indent-region (point-min) (point-max) nil)))

(global-set-key [f7] 'indent-buffer)

(setq make-backup-files nil)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
;;(global-set-key (kbd "C-+") 'text-scale-increase)
;;(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(cscope-program "/usr/local/bin/cscope"))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;)


 ;;;; CC-modeÅäÖÃ  http://cc-mode.sourceforge.net/
 (require 'cc-mode)
 (c-set-offset 'inline-open 0)
 (c-set-offset 'friend '-)
 (c-set-offset 'substatement-open 0)


(global-linum-mode 'linum-mode)        ;always show line number
(setq linum-format "%d ")   ;set line number format

(winner-mode 1)   ;;ability to revert split pane config. Call winner-undo  and winner-redo


;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)

;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )

;(defun move-cursor-next-pane()
;  "Move cursor to the next pane."
;  (interactive)
;  (other-window 1))


;(defun move-cursor-previous-pane()
;  "Move cursor to the previous pane."
;  (interactive)
;  (other-window -1))

;;(global-set-key "C-<f5>" 'move-cursor-previous-pane)
;;(global-set-key "C-<f6>" 'move-cursor-next-pane)

;;(global-set-key "\C-m" "\C-a\C- \C-n\M-w\C-y")


;;(semantic-mode 1)
;(put 'set-goal-column 'disabled nil)

;;hightlight current line
;(require 'hl-line)  
;(global-hl-line-mode t)

;;------------------------------------------------
;;cedet 安装
;;------------------------------------------------



(add-to-list 'load-path "~/.emacs.d/plugins/cedet1.1/common")
(load-file "~/.emacs.d/plugins/cedet1.1/common/cedet.el")
(require 'cedet)
(require 'semantic-ia)
(global-ede-mode 1)                      ; Enable the Project management sy

;;去掉红线
(setq semantic-show-unmatched-syntax-mode nil)


;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

;;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
 
;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))

;(defconst cedet-win32-include-dirs
;  (list "C:/MinGW/include"
;        "C:/MinGW/include/c++/3.4.5"
;        "C:/MinGW/include/c++/3.4.5/mingw32"
;        "C:/MinGW/include/c++/3.4.5/backward"
;        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))


(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


;;for function definition jump and back
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; jump between definition and declaration
(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

;;completion intelligent
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;;enable ede for project management
(global-ede-mode t)

;;enable cedet bookmark, so that f2 to set unset current line, c-f2 lookfor
;; next bookmark, s-f2 previous,  c-s-f2 clear all the bookmark in this file
;; but only jump within current buffer
(enable-visual-studio-bookmarks)

;; eassist.el for jumping between .h and .cpp
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

;; make eassist-switch-h-cpp know more about cpp
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;;enable folding , semantic-tag-folding.el
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;;enable senator-fold-tag    C-c -  + 
(global-senator-minor-mode 1)

(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;(require 'cedet)
;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;(define-key-after (lookup-key global-map [menu-bar tools])
; [speedbar]
; '("Speedbar" .
; speedbar-frame-mode)
; [calendar])
;; 指定semantic临时文件的路径，避免到处都是临时文件
(setq semanticdb-default-save-directory "~/backups/emacs/semantic")
;;;;C/C++语言启动时自动加载semantic对/usr/include的索引数据库
;;(setq semanticdb-search-system-databases t)
;(add-hook 'c-mode-common-hook
;(lambda ()
;(setq semanticdb-project-system-databases
;(list (semanticdb-create-database
;semanticdb-new-database-class
;"/usr/include")))))
;(enable-visual-studio-bookmarks) ;开启高亮书签
;(require 'eassist nil 'noerror) ;开启头文件和源文件之间的跳转功能
(require 'semantic-tag-folding nil 'noerror) ;;使用semantic的代码折叠功能



;(require 'semantic/bovine/gcc)
;(semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)

;(defun my-c-mode-cedet-hook (
;   (local-set-key "." 'semantic-complete-self-insert)
;   (local-set-key ">" 'semantic-complete-self-insert)))

;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(global-set-key [f1] 'shell) ; 进入shell

(require 'highlight-symbol)
;   (global-set-key [(control f3)] 'highlight-symbol-at-point)
;   (global-set-key [f3] 'highlight-symbol-next)
;    (global-set-key [(shift f3)] 'highlight-symbol-prev)
;    (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(global-set-key [(control f6)] 'highlight-symbol-at-point);;高亮所有当前符号
(global-set-key [f6] 'highlight-symbol-next);;查找下一个当前符号
(global-set-key [(meta f6)] 'highlight-symbol-prev);;查找上一个当前符号
(global-set-key [(control shift f6)] 'highlight-symbol-remove-all);;去除所有高亮

;(global-set-key [C-f11] 'comment-or-uncomment-region) ; 注释 / 取消注释

;;(global-set-key [f7] 'c-indent-line-or-region) ; 格式化代码
(global-set-key [C-tab] 'other-window) ; 切换窗口

;(global-set-key [M-return] 'delete-other-windows) ; 关闭其他窗

(global-set-key (kbd "S-<SPC>") 'set-mark-command) ;用shift+space 来
;setmark 了, C-@ 很不好按



;(global-set-key [M-S-f12] 'semantic-analyze-proto-impl-toggle);

;(add-to-list 'auto-mode-alist '("\\.c\\" . c-mode))
;(add-to-list auto-mode-alist '("\\.cpp\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.cc\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.cxx\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.h\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.hxx\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.hh\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.HH\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.cxx\\" . c++-mode))
;(add-to-list auto-mode-alist '("\\.java\\" . java-mode))


;;------------显示时间设置------------------------------

(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;;------------显示时间设置结束--------------


(fset 'yes-or-no-p 'y-or-n-p)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4);;tab键为8个字符宽度
(setq tab-stop-list ())
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。

(setq scroll-margin 3 scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

(show-paren-mode t) 

(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
(require 'ecb)
(require 'ecb-autoloads)

(setq ecb-layout-name "left15")
(setq ecb-show-sources-in-directories-buffer 'always)

(setq ecb-tip-of-the-day nil)
(setq stack-trace-on-error t)

;;;start ecb automatically
;;; I change it to nil to disable autostart
(setq ecb-auto-activate nil 
      ecb-tip-of-the-day nil)
;;;disable compile height
(setq ecb-compile-window-height 0)

;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
 
;;;; 隐藏和显示ecb窗口
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
 
;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)

;;;; python configuration
(setq auto-mode-alist
(cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
(cons '("python" . python-mode)
interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)
;;; add these lines if you like color-based syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;;set register to accesss init.el faster
(set-register ?i '(file . "\~/.emacs.d/init.el"))

;; 书签文件的路径及文件名
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

;; 同步更新书签文件 ;; 或者退出时保存
(setq bookmark-save-flag 1)


;;;; 使某一ecb窗口最大化
;(define-key global-map "/C-c1" 'ecb-maximize-window-directories)
;(define-key global-map "/C-c2" 'ecb-maximize-window-sources)
;(define-key global-map "/C-c3" 'ecb-maximize-window-methods)
;(define-key global-map "/C-c4" 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
;(define-key global-map "/C-c`" 'ecb-restore-default-window-sizes)

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
 '(ecb-source-path (quote ((#("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))))))
 '(markdown-command "/usr/local/bin/pandoc -f markdown -t html -s -c /usr/local/local_src/pandoc/pandoc_style_template.css")
 '(molokai-theme-kit t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

