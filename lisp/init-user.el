;; [Theme]
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; disable menu bar
(menu-bar-mode -1)

;; shared the clipboard, only for OS X
(defun copy-from-osx ()
	(shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
	(let ((process-connection-type nil))
		(let ((proc (start-process"pbcopy" "*Messages*" "pbcopy")))
			(process-send-string proc text)
			(process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)

(setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))

;; set scroll-mode
(setq scroll-step            1
      scroll-conservatively  10000)

;; search file
(define-key evil-normal-state-map "P" 'helm-projectile) ; shift-p, just like ctrp-p,

;; search command
(define-key evil-normal-state-map "n" 'smex)            ; use the easy command mode
(define-key evil-normal-state-map "N" 'smex-major-mode-commands)


(provide 'init-user)
