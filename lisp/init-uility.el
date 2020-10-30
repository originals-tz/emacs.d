(use-package helm
	:ensure t)
(use-package smex
	:ensure t)
(use-package helm-projectile
	:ensure t)
(use-package sr-speedbar 
	:ensure t)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq dframe-update-speed t)
(global-set-key (kbd "<f5>") (lambda()
			       (interactive)
			       (sr-speedbar-toggle)))
(require 'helm-config)
(smex-initialize)
(provide 'init-uility)
