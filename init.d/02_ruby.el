(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(require 'compile)
 
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'enh-ruby-mode-hook 'whitespace-mode)
(add-hook 'enh-ruby-mode-hook (lambda () (interactive) (fci-mode)))

(add-hook 'enh-ruby-mode-hook
	  (lambda () (rvm-activate-corresponding-ruby)))


(add-hook 'enh-ruby-mode-hook
	  (lambda ()
	    (add-to-list 'compilation-error-regexp-alist
			 '("\[\\(.*?\\):\\([0-9]+\\)\]:$" 1 2))))
(require 'smartparens-ruby)

(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))
