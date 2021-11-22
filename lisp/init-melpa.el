(require 'package)

;; disable menu bar
(menu-bar-mode -1)
;; set backup
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; add melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; add use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; install vim
(use-package evil
  :ensure t
  :config (evil-mode 1))

;; set scroll-mode
(setq scroll-step            1
      scroll-conservatively  10000)

(use-package smex
	:ensure t)
;; search command
(define-key evil-normal-state-map "n" 'smex)            ; use the easy command mode

(use-package helm
	:ensure t)

(use-package helm-projectile
	:ensure t)
;; search file
(define-key evil-normal-state-map "P" 'helm-projectile) ; shift-p


(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (cc-mode . lsp)
         )
  :commands lsp)

(use-package company
	:ensure t
	:init (global-company-mode))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; optional if you want which-key integration


(use-package ccls
  :init
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq ccls-executable "/usr/local/bin/ccls")



(provide 'init-melpa)
