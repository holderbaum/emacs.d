;; eRuby
(require 'mmm-auto)
(require 'mmm-erb)

(setq mmm-global-mode 'auto)

(mmm-add-mode-ext-class 'markdown-erb-mode "\\.markdown\\.erb\\'" 'erb)

(add-to-list 'auto-mode-alist '("\\.markdown\\.erb\\'" . 'markdown-erb-mode))
