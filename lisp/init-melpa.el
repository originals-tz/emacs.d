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

;; search command
(use-package smex
	:ensure t)
(define-key evil-normal-state-map "n" 'smex)            ; use the easy command mode

;; search file
(use-package helm
	:ensure t)
(use-package helm-projectile
	:ensure t)
(define-key evil-normal-state-map "P" 'helm-projectile) ; shift-p


(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (cc-mode . lsp)
         )
  :commands lsp)

;; for lsp
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
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq ccls-executable "/usr/local/bin/ccls")

;; dired tree
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

;; theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dark+ t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; clang-format
(use-package clang-format
  :ensure t
  :commands (clang-format-region clang-format-buffer)
  )
(add-hook 'c++-mode-hook '(lambda()
			    (add-hook 'before-save-hook 'clang-format-buffer)
			    ))

;; set the switch-case offset style
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (c-set-offset 'case-label '+)
            (c-set-offset 'inline-open '0)))

(defun cpp-run ()
  (interactive)
  ;; get the result of compilation
  (setq-local result (shell-command
		      (concat "g++ -std=c++11 -g "
			      (file-name-nondirectory buffer-file-name))))
  ;; if compile successfully, run the program
  (if (eq result 0)
      (shell-command "./a.out")
    )
  )

(add-hook 'c++-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c r") 'cpp-run)))

(use-package shell-pop
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-size 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom")
 '(shell-pop-autocd-to-working-dir t)
 '(shell-pop-restore-window-configuration t)
 '(shell-pop-cleanup-buffer-at-process-exit t))

(provide 'init-melpa)
