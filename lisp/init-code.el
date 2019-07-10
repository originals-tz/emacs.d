
(toggle-truncate-lines 1)

;;brackets completion
(electric-pair-mode t)

;;commend
(global-set-key (kbd "C-c ,") 'uncomment-region)
(global-set-key (kbd "C-c /") 'comment-region)

;; show all and hide all
(define-key evil-normal-state-map "zO" 'hs-show-all)
(define-key evil-normal-state-map "zC" 'hs-hide-all)

(provide 'init-code)
