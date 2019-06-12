(setq org-startup-indented t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; hot key
(add-hook 'org-mode-hook
      (lambda ()
        (local-set-key (kbd "C-c a") 'org-show-subtree)))
(global-set-key (kbd "C-c c") 'org-capture)

;; label
(setq org-todo-keywords
      '((sequence "TODO" "HANDLE" "|" "DONE")))

(setf org-todo-keyword-faces '(("TODO" . (:foreground "red" :weight bold))
                                ("HANDLE" . (:foreground "green" :weight bold))
                                ("DONE" . (:foreground "blue" :weight bold))))

;; set default-path for capture
(setq org-default-notes-file (concat user-emacs-directory "task_list.org"))

;; my-project-task-path 
(setq project-tasks (concat user-emacs-directory "org_files/project_tasks.org"))

(defun my-project-tasks ()
  (interactive)
  (find-file project-tasks))

;; configure org-capture templates
;; Template : Project
(setq org-capture-templates '()) ;; define a empty list
(if (file-exists-p project-tasks)
    (add-to-list 'org-capture-templates
          '("t"
             "Project Task"
             entry
             (file+headline project-tasks "Project Tasks")
             "* TODO %^{Task}\n- Project : %^{Project Name}\n- Description : %^{Task Description}\n"))
)
(provide 'init-org)
