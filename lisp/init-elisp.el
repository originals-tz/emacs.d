;; elisp
(defun eval-this-buffer ()
    (interactive)
    (eval-buffer nil (get-buffer-create "output"))
    (display-buffer "output"))
(provide 'init-elisp)
