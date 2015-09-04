;; Require org mode
(require 'org-install)
(require 'ob-tangle)

;; Load the custom configuration file
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))
