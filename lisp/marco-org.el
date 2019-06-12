;; define org export marco
;; PDF
;; HTML
(fset 'export-org-to-pdf
   "\C-c\C-elo")

(add-hook 'org-mode-hook
      (lambda ()
        (local-set-key (kbd "C-c p RET") 'export-org-to-pdf)))

(fset 'export-org-to-HTML
   "\C-c\C-eho")

(add-hook 'org-mode-hook
      (lambda ()
        (local-set-key (kbd "C-c h RET") 'export-org-to-HTML)))

(provide 'marco-org)
;; end

