(let ((langs '("english" "german8")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

(cycle-ispell-languages)

(global-set-key [f6] 'cycle-ispell-languages)
(global-set-key [f7] 'flyspell-buffer)
(global-set-key [f8] 'flyspell-goto-next-error)
