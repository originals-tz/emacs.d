(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(package-initialize)
;; package manager
(require 'init-melpa)
(require 'init-usepackage)
;; vim
(require 'init-vim)
(require 'init-cpp)
(require 'init-code)
;; code
;;(require 'init-org)
;; tool
(require 'init-uility)
(require 'grep-dired)
;; user
(require 'init-modeline)
;;(require 'init-snippet)
(require 'init-marco)
(require 'init-user)
(put 'narrow-to-region 'disabled nil)
(global-linum-mode)
(setq linum-format "%4d ")
