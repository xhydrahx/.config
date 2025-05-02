(setq make-backup-files nil)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(require 'package)
(package-initialize)

(unless package-archive-contents
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))

(load-theme 'gruvbox t)

(menu-bar-mode -1)

(dolist (pkg '(rust-mode eglot company which-key))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)

(which-key-mode)

(add-hook 'prog-mode-hook 'eglot-ensure)

(defun my/setup-company-for-eglot ()
  (setq-local company-backends '(company-capf))
  (company-mode 1))

(add-hook 'eglot-managed-mode-hook #'my/setup-company-for-eglot)

(add-hook 'rust-mode-hook
          (lambda ()
            (eglot-ensure)))
