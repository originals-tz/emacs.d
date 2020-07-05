;;-----
;; TAGS
;;-----
(use-package counsel-etags
  :ensure t
  :bind (("C-]" . counsel-etags-find-tag-at-point))
  :init
  (add-hook 'prog-mode-hook
        (lambda ()
          (add-hook 'after-save-hook
            'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories))

(add-hook 'c++-mode-hook
      (lambda ()
        (local-set-key (kbd "C-j") 'counsel-etags-find-tag-at-point)))

(add-hook 'c++-mode-hook
      (lambda ()
        (local-set-key (kbd "C-k") 'counsel-etags-grep-current-directory)))

;;-----
;; irony
;;-----
(use-package irony
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

;;-----
;; company
;;-----
(use-package company
	:ensure t
	:init (global-company-mode))

;;-----
;; flycheck
;;-----
(use-package flycheck
  :ensure t
  :config (add-hook 'c++-mode-hook 'flycheck-mode))

;;-----
;; indent
;;-----
(defun irony--indent-or-complete ()
  "Indent or Complete"
  (interactive)
  (cond ((and (not (use-region-p))
              (irony--check-expansion))
         (message "complete")
         (company-complete-common))
        (t
         (message "indent")
         (call-interactively 'c-indent-line-or-region))))

(defun irony--check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

;;-----
;;CMake
;;-----
(use-package cmake-ide
  :ensure t
  :defer t
  :init (progn
	  (add-hook 'c++-mode-hook (lambda () (cmake-ide-setup)))
	  (add-hook 'c-mode-hook (lambda () (cmake-ide-setup)))
	  )
)
(use-package cmake-mode
  :ensure t
  :mode (
	 ("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 )
)
(use-package rtags
  :ensure t)
(cmake-ide-setup)

;;(setq rtags-verify-protocol-version nil)
;;-----
;; enables the completion of C/C++ header file
;;-----
;;; backends for irony-c-header
(use-package company-irony-c-headers
  :ensure t
  :defer t
  :init (progn (add-hook 'c-mode-hook
       (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
         (add-hook 'c++-mode-hook
       (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
         ))

;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;;-----
;;C++
;;-----

(use-package clang-format
  :ensure t
  :commands (clang-format-region clang-format-buffer)
  )

(add-hook 'c++-mode-hook '(lambda()
                            (add-hook 'before-save-hook 'clang-format-buffer)
                            ))

(defun cpp-run ()
  (interactive)
  ;; get the result of compilation
  (setq-local result (shell-command
   (concat "g++ -std=c++11 -g "
           (file-name-nondirectory buffer-file-name))))
  ;; if compile successfully, run the program
  (if (eq result 0)
      (shell-command "./a.out")
  )
  )
(add-hook 'c++-mode-hook
      (lambda ()
        (local-set-key (kbd "C-c r") 'cpp-run)))


(add-hook 'c++-mode-hook (lambda ()
			   (setq flycheck-clang-language-standard "c++17")
			   (setq irony-additional-clang-options '("-std=c++17"))))

(setq-default indent-tabs-mode nil) ;;use 4-space replace tab
(setq c-default-style "linux"
      c-basic-offset 4)

;; set the switch-case offset style
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (c-set-offset 'case-label '+)
            (c-set-offset 'inline-open '0)))

(add-hook 'c++-mode-hook 'hs-minor-mode)

(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

(provide 'init-cpp)
