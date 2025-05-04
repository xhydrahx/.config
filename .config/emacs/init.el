(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(setq auto-save-file-name-transforms
            `((".*" "~/.emacs.d/autosaves/" t)))

(menu-bar-mode -1)

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
;; (package-refresh-contents)

(dolist (pkg '(fzf gruvbox-theme doom-modeline))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(load-theme 'gruvbox t)

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-lsp t)
(setq doom-modeline-modal-modern-icon t)
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-buffer-file-name-style 'auto)
(setq doom-modeline-unicode-fallback t)
(setq doom-modeline-column-zero-based t)
(setq doom-modeline-position-line-format '("%l/%c"))
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-project-name t)
(setq doom-modeline-lsp t)
(setq doom-modeline-env-version nil)
(setq doom-modeline-modal-modern-icon t)
(setq doom-modeline-percent-position nil)
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline-checker-simple-format t)

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

(defun my/rust-setup ()
  (eglot-ensure))

(add-hook 'rust-mode-hook #'my/rust-setup)

(defun my/eglot-format-buffer-on-save ()
  (when (eglot-managed-p)
    (eglot-format-buffer)))

(defun my/eglot-managed-mode-setup ()
  (add-hook 'before-save-hook #'my/eglot-format-buffer-on-save nil t))

(add-hook 'eglot-managed-mode-hook #'my/eglot-managed-mode-setup)

(define-key eglot-mode-map (kbd "C-c a") 'eglot-code-actions)
