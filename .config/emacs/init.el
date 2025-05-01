(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))

(menu-bar-mode -1)

(add-hook 'prog-mode-hook 'eglot-ensure)

(setq make-backup-files nil)
(setq auto-save-default nil)
