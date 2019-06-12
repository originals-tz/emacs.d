(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(package-initialize)
;; package manager
(require 'init-melpa)
(require 'init-usepackage)
;; vim
(require 'init-vim)
;; code
(require 'init-cpp)
(require 'init-elisp)
(require 'init-code)
(require 'init-org)
;; tool
(require 'init-uility)
(require 'init-refactor-tool)
(require 'init-git)
;; user
(require 'init-modeline)
(require 'init-snippet)
(require 'init-marco)
(require 'init-user)
(put 'narrow-to-region 'disabled nil)
