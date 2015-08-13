(defun my-move-line-up (p)   
  "move current line up"
  (interactive "p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (previous-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defun my-move-line-down (p)   
  "move current line down"
  (interactive "p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (next-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defun my-dup-line-down ()    
  "duplicate this line at next line"
  (interactive)
  (let ((c (current-column)))
    (beginning-of-line)
    (ue-select-line-down)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defvar ue-selection-last-point nil
  "Indicates whether to kill-append or kill-new")
(defvar ue-selection-total-lines 0
  "Total number of lines appended so far to the last item in kill-ring")

(defun ue-selection-update-cont ()
  "Update `ue-selection-last-point' variable"
  (if (and this-command
           (string= (format "%s" this-command)
                    "ue-select-line-down-continued"))
      (setq ue-selection-last-point (point))
    (setq ue-selection-total-lines 0)
    (setq ue-selection-last-point  nil)))

(add-hook 'post-command-hook 'ue-selection-update-cont)

(defun ue-select-line-down-continued () 
  "like Shift+down in UltraEdit, but do no selection.
Just put these continuous lines all toghether as a new item in kill-ring.
Messages will appear in minibuffer telling you how many lines were copied.
Continuous commands with no interruption append new lines to the item.
Any non-ue-select-line-down-continued command will stop gathering new lines
and make a new item in kill-ring.

post-command-hook is used in detecting the continuity of this command.
check `ue-selection-update-cont' and `post-command-hook'."
  (interactive)
  (let ((s (point)))
    (setq next-line-add-newlines t)
    (next-line 1)
    (setq next-line-add-newlines nil)
    (if (and ue-selection-last-point
             (= (save-excursion
                  (when (> (count-lines (point-min) (point)) 1)
                    (previous-line 1))
                  (point))
                ue-selection-last-point))
        (progn
          (kill-append (buffer-substring s (point)) nil)
          (setq ue-selection-total-lines (1+ ue-selection-total-lines))
          (message (format "%s lines copied" ue-selection-total-lines)))
      (kill-new (buffer-substring s (point)))
      (message "1 line copied")
      ;; some errors will cause post-command-hook deletion
      ;; so add-hook every time after we add the first line
      (add-hook 'post-command-hook 'ue-selection-update-cont)
      (setq ue-selection-total-lines 1))))

(defun ue-select-line-down ()
  "like Shift+down in UltraEdit."
  (interactive)
  (let ((s (point)))
  (setq next-line-add-newlines t)
  (next-line 1)
  (setq next-line-add-newlines nil)
  (kill-new (buffer-substring s (point)))))

(defun my-open-next-line (arg)    
    (interactive "p")
    (end-of-line)
    (open-line arg)
    (next-line 1)
    (when newline-and-indent
        (indent-according-to-mode)))

(defun my-open-previous-line (arg)    
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun my-delete-current-line ()
    (interactive)
    (beginning-of-line)
    (kill-line))

(global-set-key   [s-up]        'my-move-line-up)
(global-set-key   [s-down]      'my-move-line-down)
(global-set-key   [s-left]      'my-dup-line-down)
(global-set-key   [s-right]     'ue-select-line-down-continued)

(global-set-key (kbd "s-d") 'my-delete-current-line)

;;;;(global-unset-key (kbd "s-d"))
;;;(global-set-key   [s-d]         'my-delete-current-line)


(global-set-key (kbd "M-o") 'my-open-next-line)
;;;(global-set-key (kbd "M-O") 'my-open-previous-line)

