(setq org-startup-indented t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO" "HAND" "|" "DONE")))
(setf org-todo-keyword-faces '(("TODO" . (:foreground "red" :weight bold))
                                ("HAND" . (:foreground "green" :weight bold))
                                ("DONE" . (:foreground "blue" :weight bold))))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-default-notes-file (concat user-emacs-directory "task_list.org"))
(setq project-tasks (concat user-emacs-directory "org_files/project_tasks.org"))

;; open the org file quickly
(defun my-project-tasks ()
  (interactive)
  (find-file project-tasks))

;; configure org-capture templates
;; Template : Project
(if (file-exists-p project-tasks)
    (add-to-list 'org-capture-templates
          '(("t"
             "Project Task"
             entry
             (file+headline project-tasks "Project Tasks")
             "* TODO %^{Task Detail}\n- Project :%^{Project Name}\n")))
)
(provide 'init-org)
