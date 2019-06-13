(use-package htmlize
  :ensure t)
(setq org-startup-indented t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; hot key
(add-hook 'org-mode-hook
      (lambda ()
        (local-set-key (kbd "C-c a") 'org-show-subtree)))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)


;; label
(setq org-todo-keywords
      '((sequence "TODO" "HANDLE" "|" "DONE")))

(setf org-todo-keyword-faces '(("TODO" . (:foreground "red" :weight bold))
                                ("HANDLE" . (:foreground "green" :weight bold))
                                ("DONE" . (:foreground "blue" :weight bold))))

;; task-path 
(setq org-default-notes-file (concat user-emacs-directory "tasks/normal_tasks.org"))
(setq project-tasks (concat user-emacs-directory "tasks/project_tasks.org"))
(setq exercise-tasks (concat user-emacs-directory "tasks/exercise_tasks.org"))

(setq org-agenda-files (list "~/.emacs.d/tasks/normal_tasks.org"
                             "~/.emacs.d/tasks/project_tasks.org"
                           ))

(defun my-normal-tasks()
  (interactive)
  (find-file org-default-notes-file))

(defun my-project-tasks ()
  (interactive)
  (find-file project-tasks))

(defun my-exercise-tasks ()
  (interactive)
  (find-file exercise-tasks))

;; configure org-capture templates
;; Template : Project
(setq org-capture-templates '()) ;; define a empty list

(if (file-exists-p project-tasks)
    (add-to-list 'org-capture-templates
          '("n"
             "Normal Task"
             entry
             (file+headline org-default-notes-file "Normal Task")
             "* TODO %^{Task}\n"))
)

(if (file-exists-p project-tasks)
    (add-to-list 'org-capture-templates
          '("t"
             "Project Task"
             entry
             (file+headline project-tasks "Project Tasks")
             "* TODO %^{Task}\n- Project : %^{Project Name}\n- Description : %^{Task Description}\n"))
)
(provide 'init-org)
