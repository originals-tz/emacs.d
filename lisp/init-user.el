[Theme]
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; disable menu bar
(menu-bar-mode -1)

;; set scroll-mode
(setq scroll-step            1
      scroll-conservatively  10000)

;; search file
(define-key evil-normal-state-map "P" 'helm-projectile) ; shift-p, just like ctrp-p,

;; search command
(define-key evil-normal-state-map "n" 'smex)            ; use the easy command mode
(define-key evil-normal-state-map "N" 'smex-major-mode-commands)

(add-to-list 'load-path "~/.emacs.d/plugin/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-billw)

(setq backup-directory-alist (quote (("." . "~/.backups"))))

(provide 'init-user)
