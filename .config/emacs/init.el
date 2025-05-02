(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'gruvbox-theme)
(load-theme 'gruvbox t)
(menu-bar-mode -1)

(straight-use-package 'rust-mode)

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'lsp-ui)
(straight-use-package 'which-key)

(require 'lsp-mode)
(setq lsp-keymap-prefix "C-c l")
(setq lsp-rust-server 'rust-analyzer)

(which-key-mode)

(add-hook 'rust-mode-hook 'lsp)

(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)

(setq lsp-auto-guess-root t)

(straight-use-package 'company)
(straight-use-package 'company-lsp)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-capf))

(setq lsp-completion-provider :capf)
