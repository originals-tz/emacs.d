(use-package nyan-mode
  :ensure t)
(setq-default mode-line-format
      (list ""
            'mode-line-modified
            "%10b"
            '(:eval (when nyan-mode (list (nyan-create))))
            "%[("
            'mode-name
            'minor-mode-list
            "%n"
            'mode-line-process
            ")%]--"
            "Line %l--"
            '(-3 . "%P")
            "-%-"))
(nyan-mode t)
(nyan-start-animation);;开始舞动吧（会耗cpu资源）
(provide 'init-modeline)
