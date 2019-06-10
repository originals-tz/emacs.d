(use-package iedit
  :ensure t)
;; search and replace

(define-key projectile-mode-map (kbd "C-c s") 'iedit-mode)
;; narrow-to-defun  : C-x n d
;; narrow-to-region : C-x n n
;; exit from narrow-mode
(define-key projectile-mode-map (kbd "C-c w") 'widen)

;; projectile
(use-package projectile
	:ensure t)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;ivy
(use-package ivy
	:ensure t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(defun projectile-smart-search()
  (interactive)
  (let ((text (substring-no-properties (or (thing-at-point 'symbol) ""))))
    (if (projectile-project-p)
        (counsel-rg text (projectile-project-root))
      (counsel-rg text))))
(require 'wgrep)

;; use projectile-smart-search to search the project
;; C-c C-o : use ivy-occur to make result bar to a buffer
;; C-d     : use ivy-occur-delete-candidate to delete useless result from buffer
;; w       : use ivy-wgrep-change-to-wgrep-mode to enter wgrep mode
;; C-c s   : use iedit-mod to change the result

(provide 'init-refactor-tool)
