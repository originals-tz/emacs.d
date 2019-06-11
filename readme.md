## Emacs.d

My emacs configuration. This configuration includes:

- Package Manager :
    - Melpa
    - Use-pakcage
- CPP Plugin
    - Irony
    - Company
    - Flycheck
    - CMake-IDE
-   Vim Plugin
    - evil
- Refactor Tool
    - iedit-mode
    - narrow-mode
    - projectile
    - ivy (you should install rg from apt/brew or other system package manager)
- Uility Tool
    - helm
    - smex

### How to structure your emacs configuration？

 A simple example is:

```
~/.emacs
   |__init.el
   |
   |__lisp
       |__init-mepla.el
```

When the emacs startups, it will load the `init.el`

So, you can splite your configuration into many `.el` fils, and load them into emacs from the init.el

Such as

```lisp
;; init.el
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ;; add a path for searching

(setq custom-file (expand-file-name "custom.el" user-emacs-directory)) ;; set a file for adding custom-set-variables, if you don't do it, the variables will be wrote into your configure file

(require 'init-mepla) ;; load your configure file
```

```lisp
;; init-mepla.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(provide 'init-melpa) ;; missing this statement, you will get a error, because you require this model in init.el
```
### Something about emacs

if you get a error from eamcs, you can see the message from Message buffer

### For MacOS User

1. if you get a error when open the cpp file , such as 'wchar.h not found', you can try to install **SDK header**

```
open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
```

2. you can download the latest version of iterm2, it provides a Minimal theme for title bar, it is very nice