(require 'auto-complete-config)

(ac-config-default)
(add-to-list 'ac-dictionary-directories
  "~/.emacs.d/elpa/auto-complete-20140314.802/dict")

(setq ac-ignore-case nil)

(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
