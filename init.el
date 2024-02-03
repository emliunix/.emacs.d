;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default))
 '(frame-background-mode 'dark)
 '(indent-tabs-mode nil)
 '(lsp-keymap-prefix "C-c l")
 '(lsp-rust-analyzer-server-display-inlay-hints t)
 '(lsp-rust-server 'rust-analyzer)
 '(lsp-semantic-highlighting :deferred)
 '(package-archives
   '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
 '(projectile-completion-system 'helm)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(read-process-output-max 2097152)
 '(gc-cons-threshold 100000000))

;; load user customs
(let ((file-custom-el (concat (file-name-as-directory user-emacs-directory) "my-custom.el")))
  (when (file-exists-p file-custom-el)
    (load file-custom-el)))

;; package-init
(add-hook 'after-init-hook
          (lambda ()
	    (load (concat (file-name-as-directory user-emacs-directory) "package-init.el"))))

;; straight.el
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
(straight-use-package 'use-package)

;; Elpa mirror backup in case tuna is not accessible
;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(use-package flycheck
  :straight t)
(use-package magit
  :straight t)
(use-package yasnippet
  :straight t)
(use-package company
  :straight t)
(use-package rainbow-delimiters
  :straight t)
(use-package pretty-mode
  :straight t)
(use-package restclient
  :straight t)
(use-package restclient-helm
  :straight t)
(use-package auctex
  :straight t)
(use-package dockerfile-mode
  :straight t)
(use-package emmet-mode
  :straight t)
(use-package geiser
  :straight t)
(use-package helm
  :straight t)
(use-package helm-projectile
  :straight t)
(use-package json-mode
  :straight t)
(use-package markdown-mode+
  :straight t)
(use-package paredit
  :straight t)
(use-package projectile
  :straight t)
(use-package rust-mode
  :straight t)
(use-package sml-mode
  :straight t)
(use-package syntax-subword
  :straight t)
(use-package toml-mode
  :straight t)
(use-package yaml-mode
  :straight t)
(use-package zenburn-theme
  :straight t)

;; lsp-mode
(use-package lsp-mode
  :straight t
  :init
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp
  :straight t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :straight t
  :commands lsp-treemacs-errors-list)

;; lsp python
(use-package lsp-pyright
  :straight t
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

;; lean4
(use-package lean4-mode
  :straight (lean4-mode
	     :type git
	     :host github
	     :repo "leanprover/lean4-mode"
	     :files ("*.el" "data"))
  ;; to defer loading the package until required
  :commands (lean4-mode))

;; copilot
(use-package copilot
  :straight (:host github
             :repo "copilot-emacs/copilot.el"
             :files ("dist" "*.el"))
  :ensure t)

;; doom modeline
(use-package doom-modeline
  :straight t
  :ensure t
  :init (doom-modeline-mode 1))

;; highlight parenthesis
(show-paren-mode 1)
; use syntax-subword instead
(global-subword-mode 1)
;; electric pair mode
(electric-pair-mode 1)
;; eldoc mode
(global-eldoc-mode 1)
;; savehist
(savehist-mode 1)

(defun open-init-file ()
  (interactive)
  (find-file (concat (file-name-as-directory user-emacs-directory) "init.el")))

(defun open-package-init-file ()
  (interactive)
  (find-file (concat (file-name-as-directory user-emacs-directory) "package-init.el")))
