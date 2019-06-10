;;-----
;; irony
;;-----
(use-package irony
  :ensure t)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

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
  :init (global-flycheck-mode))

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
(require 'rtags)
(cmake-ide-setup)

;;-----
;; enables the completion of C/C++ header file
;;-----
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;;; backends for irony-c-header
(use-package company-irony-c-headers
  :ensure t
  :defer t
  :init (progn (add-hook 'c-mode-hook
       (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
         (add-hook 'c++-mode-hook
       (lambda () (add-to-list 'company-backends 'company-irony-c-headers)))
         ))

;;-----
;;C++
;;-----
(add-hook 'c++-mode-hook (lambda ()
			   (setq flycheck-clang-language-standard "c++11")
			   (setq irony-additional-clang-options '("-std=c++11"))))

(setq-default indent-tabs-mode nil) ;;use 4-space replace tab
(setq c-default-style "linux"
      c-basic-offset 4)

;; set the switch-case offset style
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'case-label '+)))

(add-hook 'c++-mode-hook 'hs-minor-mode)

(provide 'init-cpp)