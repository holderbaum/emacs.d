(menu-bar-mode -1)

;; Customizations shall be stored in custom.el
(setq custom-file 
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq init-dir 
      (expand-file-name "init.d" user-emacs-directory))

(setq vendor-dir
      (expand-file-name "vendor" user-emacs-directory))

;; Add all vendor packages to load-path
(if (file-exists-p vendor-dir)
    (dolist (vendor (directory-files vendor-dir t))
      (add-to-list 'load-path vendor)))

;; Load all elisp files in ./init.d
(if (file-exists-p init-dir)
    (dolist (file (directory-files init-dir t "\\.el$"))
      (load file)))
