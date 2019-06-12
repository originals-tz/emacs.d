(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(package-initialize)
(require 'init-melpa)
(require 'init-usepackage)
(require 'init-vim)
(require 'init-cpp)
(require 'init-uility)
(require 'init-code)
(require 'init-refactor-tool)
(require 'init-git)
(require 'init-modeline)
(require 'init-org)
(require 'init-snippet)
(require 'init-marco)
(require 'init-user)
(put 'narrow-to-region 'disabled nil)
