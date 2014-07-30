(defun shell-clear-region ()
  (interactive)
  (delete-region (point-min) (point-max))
  (comint-send-input))

(global-set-key (kbd "C-c C-c") 'shell-clear-region)
