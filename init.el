;; Customizations shall be stored in custom.el
(setq custom-file 
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq init-dir 
      (expand-file-name "init.d" user-emacs-directory))

;; Load all elisp files in ./init.d
(if (file-exists-p init-dir)
    (dolist (file (directory-files init-dir t "\\.el$"))
      (load file)))
