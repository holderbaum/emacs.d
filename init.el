;; Require org mode
(require 'org-install)
(require 'ob-tangle)

;; Load the custom configuration file
(org-babel-load-file (expand-file-name "emacs-init.org" user-emacs-directory))
