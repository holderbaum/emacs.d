(setq code-modes-hook nil)

;; Line numbers
(add-hook 'code-modes-hook
         (lambda () (linum-mode 1)))

;; Show whitespace
(add-hook 'code-modes-hook
         (lambda () (whitespace-mode 1)))
