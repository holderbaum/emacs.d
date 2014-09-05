(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(require 'compile)
 
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
(add-hook 'enh-ruby-mode-hook 'whitespace-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook (lambda () (interactive) (fci-mode)))

(push 'company-robe company-backends)


(add-hook 'enh-ruby-mode-hook
	  (lambda ()
	    (rvm-activate-corresponding-ruby)

            (set (make-local-variable 'compile-command)
                 (concat "bundle exec ruby -Ilib:test:spec " buffer-file-name))

	    (setq-default compilation-error-regexp-alist
			  '(
			    ("\\[\\(.*\\):\\([0-9]+\\)\\]:$" 1 2)
			    ("^ *\\([[+]\\)?\\([^:]+\\):\\([0-9]+\\):in" 2 3)
			    ("^.* at \\([^:]*\\):\\([0-9]+\\)$" 1 2)))

	    (set-ruby-default-directory)))


(defun set-ruby-default-directory ()
  (setq default-directory
	(file-name-directory
	 (get-nearest-file '("Rakefile" "Gemfile")))))

(defun get-nearest-file (compilation-filenames)
  "Search for the compilation file traversing up the directory tree."
  (let ((dir default-directory)
	(parent-dir (file-name-directory (directory-file-name default-directory)))
	(nearest-compilation-file 'nil))
    (while (and (not (string= dir parent-dir))
		(not nearest-compilation-file))
      (dolist (filename compilation-filenames)
	(setq file-path (concat dir filename))
	(when (file-readable-p file-path)
	  (setq nearest-compilation-file file-path)))
      (setq dir parent-dir
	    parent-dir (file-name-directory (directory-file-name parent-dir))))
    nearest-compilation-file))

(require 'smartparens-ruby)

(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))
