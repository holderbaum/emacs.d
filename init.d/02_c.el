(add-hook 'c-mode-common-hook (lambda () (cppcm-reload-all)))
(add-hook 'c-mode-common-hook 'whitespace-mode)
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))
(add-hook 'c-mode-common-hook (lambda () (interactive) (fci-mode)))

(setq c-default-style "linux")

(global-set-key [(control c) (C)] 'compile)
(global-set-key [(control c) (c)] 'compile-again)
(setq compilation-last-buffer nil)
(defun compile-again (pfx)
  """Run the same compile as the last time.

If there was no last time, or there is a prefix argument, this acts like
M-x compile.
"""
 (interactive "p")
 (if (and (eq pfx 1)
	  compilation-last-buffer)
     (progn
       (save-buffer)
       (set-buffer compilation-last-buffer)
       (revert-buffer t t))
   (call-interactively 'compile)))
