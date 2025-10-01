(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes '(default))
 '(frame-background-mode 'dark)
 '(gc-cons-threshold 100000000)
 '(geiser-chez-binary "chez")
 '(indent-tabs-mode nil)
 '(lsp-inlay-hint-enable t)
 '(lsp-inlay-hints t)
 '(haskell-process-show-overlays nil)
 '(indent-tabs-mode nil)
 '(lsp-inlay-hint-enable nil)
 '(lsp-keymap-prefix "C-c l")
 '(lsp-lens-enable nil)
 '(lsp-rust-server 'rust-analyzer)
 '(lsp-semantic-highlighting :deferred)
 '(package-archives
   '(("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
     ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
 '(package-selected-packages
   '(auctex company-coq copilot dockerfile-mode doom-modeline emmet-mode
            flycheck geiser-chez geiser-racket gptel haskell-mode
            hcl-mode helm-lsp helm-projectile json-mode lean4-mode
            lsp-haskell lsp-ivy lsp-pyright lsp-treemacs lsp-ui magit
            paredit pretty-mode proof-general rainbow-delimiters
            restclient-helm rust-mode sml-mode syntax-subword
            toml-mode yaml-mode zenburn-theme))
 '(package-vc-selected-packages
   '((lean4-mode :url
                 "git@github.com:leanprover-community/lean4-mode.git")))
 '(projectile-completion-system 'helm)
 '(read-process-output-max 2097152 t)
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values '((setq my-test-var 'hello)))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(safe-local-variable-directories '("/Users/emliunix/OneDrive/myobsidian/"))
 '(safe-local-variable-values '((tab-size . 4)))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "localhost:8899") ("https" . "localhost:8899"))))

;; load user customs
(let ((file-custom-el (concat (file-name-as-directory user-emacs-directory) "my-custom.el")))
  (when (file-exists-p file-custom-el)
    (message "Load my-custom.el")
    (load file-custom-el)))

;; Elpa mirror backup in case tuna is not accessible
;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(use-package helm
  :ensure t
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x c M-x" . M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x c C-x C-f" . find-file)))

(use-package flycheck
  :ensure t)
(use-package yasnippet
  :ensure t
  :init (yas-global-mode t))
(use-package company
  :ensure t
  :init (global-company-mode t))
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package pretty-mode
  :ensure t)
(use-package restclient
  :ensure t)
(use-package restclient-helm
  :ensure t)
(use-package auctex
  :ensure t)
(use-package dockerfile-mode
  :ensure t)
(use-package emmet-mode
  :hook ((html-mode css-mode) . emmet-mode)
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package paredit
  :ensure t
  :hook ((lisp-mode emacs-lisp-mode scheme-mode) . paredit-mode))
(use-package projectile
  :ensure t
  :init (projectile-mode))
(use-package sml-mode
  :ensure t)
(use-package syntax-subword
  :ensure t)
(use-package toml-mode
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package zenburn-theme
  :ensure t
  :init (if window-system
            (load-theme 'zenburn t)))
(use-package helm-projectile
  :ensure t)
(use-package magit
  :ensure t
  :commands magit-status)

;; lsp-mode
(use-package lsp-mode
  :ensure t
  ;; :hook (prog-mode . lsp-deferred)
  ;; :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
  ;;        ;; (python-mode . lsp)
  ;;        ;; if you want which-key integration
  ;;        ;; (lsp-mode . lsp-enable-which-key-integration)
  ;;        )
  :commands lsp)

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
;; ivy
(use-package ivy
  :ensure t)
(use-package lsp-ivy
  :ensure t)

(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp))

;; lsp python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

;; lean4
(use-package lean4-mode
  :vc (:url "git@github.com:leanprover-community/lean4-mode.git")
  :ensure t
  ;; to defer loading the package until required
  :commands lean4-mode)

(use-package geiser-chez
  :ensure t)
(use-package geiser-racket
  :ensure t)
(use-package geiser
  :ensure t)

;; copilot
(use-package copilot
;;   :custom ((warning-suppress-types
;;             ((Copilot Copilot-No-Mode-Indent)
;;              (Copilot Copilot-Exceeds-Max-Char)))
;;            (warning-suppress-log-types
;;             ((copilot copilot-no-mode-indent))))
  :hook (prog-mode . copilot-mode)
  :bind (("C-<tab>" . copilot-accept-completion))
  :ensure t)

;; doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package proof-general
  :ensure t)

(use-package haskell-mode
  :ensure t)

(use-package lsp-haskell
  :ensure t
  :hook (haskell-mode . lsp))

(use-package company-coq
  :ensure t
  :hook (coq-mode . company-coq-mode))

(use-package hcl-mode
  :ensure t)

(use-package haskell-mode
  :straight t
  :ensure t)

(use-package lsp-haskell
  :straight t
  :ensure t
  :hook (haskell-mode . lsp))

(use-package which-key
  :init (which-key-mode 1))

;; highlight parenthesis
(show-paren-mode 1)
; use syntax-subword instead
;; (global-subword-mode 1)
;; electric pair mode
(electric-pair-mode 1)
;; eldoc mode
(global-eldoc-mode 1)
;; savehist
(savehist-mode 1)

(defun open-init-file ()
  (interactive)
  (find-file (concat (file-name-as-directory user-emacs-directory) "init.el")))

;; OCaml setup
;; (autoload 'utop "~/.emacs.d/utop.el" "Toplevel for OCaml" t)
(let ((opam-exe (executable-find "opam")))
  (when opam-exe
    (message "Found opam: %s" opam-exe)
    (condition-case err
        (let* ((share-dir (file-name-as-directory (car (process-lines "opam" "var" "share"))))
               (site-dir (file-name-as-directory (concat share-dir "emacs/site-lisp")))
	       (merlin-el-path (concat site-dir "merlin.el"))
	       (utop-el-path (concat site-dir "utop.el"))
	       (caml-el-path (concat site-dir "caml.el"))
	       (tuareg-site-file-el-path (concat site-dir "tuareg-site-file.el")))
          ;; add emacs site-lisp in opam share directory
          (when (file-exists-p site-dir)
            (push site-dir load-path)
            ;; (print (concat "merlin.el " merlin-el-path))
            ;; (print (concat "utop.el " utop-el-path))
            (when (file-exists-p merlin-el-path)
	      ;; load merlin
              (message "merlin.el found: %s" merlin-el-path)
	      (setq merlin-command 'opam)
	      (autoload 'merlin-mode "merlin" "Merlin mode" t)
	      (add-hook 'tuareg-mode-hook 'merlin-mode))
            (when (file-exists-p utop-el-path)
	      ;; load utop
              (message "utop.el found: %s" utop-el-path)
	      (autoload 'utop "utop.el" "Toplevel for OCaml" t))
            (when (file-exists-p caml-el-path)
	      ;; load caml mode
              (message "caml.el found: %s" caml-el-path)
	      (autoload 'caml "caml.el" "Caml mode" t)
              (if window-system (require 'caml-font)))
            (when (file-exists-p tuareg-site-file-el-path)
	      ;; load tuareg
              (message "tuareg-site-file.el found: %s" tuareg-site-file-el-path)
	      (load tuareg-site-file-el-path))))
        (error (message "Failed initializing OCaml env: %s: %s" (car err) (cdr err))))))

;; emoji
(when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font
   t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))
