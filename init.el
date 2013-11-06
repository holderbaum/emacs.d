;; Customizations shall be stored in custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Marmalade package repo
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
