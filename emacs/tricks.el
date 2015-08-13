;; duplicate current line
    (defun duplicate-current-line (&optional n)
      "duplicate current line, make more than 1 copy given a numeric argument"
      (interactive "p")
      (save-excursion
        (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
          ;; when on last line, insert a newline first
          (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))
    
          ;; now insert as many time as requested
          (while (> n 0)
    	(insert current-line)
    	(decf n)))))
    
    (global-set-key (kbd "C-S-d") 'duplicate-current-line)



 (defun copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))













