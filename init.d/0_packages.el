(require 'package)

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(package-initialize)

(setq required-packages 
      (list 'magit))

(dolist (package required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
