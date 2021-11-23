(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(package-initialize)
;; package manager
(require 'init-melpa)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
