(require 'package)

(add-to-list 'package-archives 
  '("marmalade" .
    "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
  '("melpa" .
    "http://melpa.milkbox.net/packages/"))

(package-initialize)

(defun check-packages (packages)
  (dolist (package packages)
    (when (not (package-installed-p package))
      (package-refresh-contents)
      (package-install package))))
