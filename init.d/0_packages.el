(require 'package)

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
	     '("melpa" .
	       "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq required-packages 
      (list
       'magit
       'ruby-mode
       'color-theme
       'color-theme-monokai))

(dolist (package required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

