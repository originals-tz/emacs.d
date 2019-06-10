;;brackets completion
(electric-pair-mode t)

;;commend
(global-set-key (kbd "C-c ,") 'comment-region)
(global-set-key (kbd "C-c p") 'uncomment-region)

;; show all and hide all
(define-key evil-normal-state-map "zO" 'hs-show-all)
(define-key evil-normal-state-map "zC" 'hs-hide-all)

(provide 'init-code)
