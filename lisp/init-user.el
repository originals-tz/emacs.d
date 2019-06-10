;; [Theme]
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))


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

(setq scroll-step            1
      scroll-conservatively  10000)
;; comment
(global-set-key (kbd "C-c ,") 'comment-region)
(global-set-key (kbd "C-c p") 'uncomment-region)

;; search file
(define-key evil-normal-state-map "P" 'helm-projectile) ; shift-p, just like ctrp-p,

;; search command
(define-key evil-normal-state-map "n" 'smex)            ; use the easy command mode
(define-key evil-normal-state-map "N" 'smex-major-mode-commands)

;; show all and hide all
(define-key evil-normal-state-map "zO" 'hs-show-all)
(define-key evil-normal-state-map "zC" 'hs-hide-all)

(provide 'init-user)