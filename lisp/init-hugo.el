;; (use-package ox-hugo
  ;; :ensure t            ;Auto-install the package from Melpa (optional)
  ;; :after ox)
(use-package easy-hugo
  :ensure t
:init
;; Main blog
(setq easy-hugo-postdir "content/posts/org")
(setq easy-hugo-basedir "~/Code/HugoBlog/")
(setq easy-hugo-url "https://yourblogdomain")
(setq easy-hugo-sshdomain "blogdomain")
(setq easy-hugo-root "/User/originals/Code/HugoBlog/")
(setq easy-hugo-previewtime "300")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)
:bind ("C-c C-e" . easy-hugo))

(provide 'init-hugo)
