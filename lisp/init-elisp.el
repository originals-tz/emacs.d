;; elisp
(defun eval-this-buffer ()
    (interactive)
    (eval-buffer nil (get-buffer-create "output"))
    (switch-to-buffer-other-window "output"))
(provide 'init-elisp)
