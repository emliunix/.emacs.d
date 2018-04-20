
;; company mode backends
(global-company-mode)

;; helm
(require 'helm-config)
; starts helm at startup
(helm-mode 1)
;; bind helm-M-x to M-x
(global-set-key (kbd "M-x") 'helm-M-x)
;; bind helm-find-files to C-x C-f
;; and rebound origin find-file to C-x c C-x C-f
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x c C-x C-f") 'find-file)

;; bind helm-buffers-list to C-x C-b
; C-x b suffice
;(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;(global-set-key (kbd "C-x c C-x C-b") 'buffer-list)

;; zenburn theme
;; load theme when using GUI
(if window-system
  (load-theme 'zenburn t))

;; haskell-mode-hook
(defun my-haskell-setup ()
  (haskell-doc-mode)
  (interactive-haskell-mode +1)
  (haskell-indentation-mode)
  (structured-haskell-mode)
  (ghc-init)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
  (setq-local company-backends
	      (append '(company-ghc)
		      company-backends)))

(add-hook 'haskell-mode-hook 'my-haskell-setup)

;; AucTeX mode company-math
(defun my-TeX-setup ()
  (setq-local company-backends
	      (append '((company-math-symbols-latex company-latex-commands))
		      company-backends)))

(add-hook 'TeX-mode-hook 'my-TeX-setup)

;; syntax-subword-mode
(global-syntax-subword-mode 1)

;; emmet
(defun my-html-setup ()
  (emmet-mode t))
  ;; (setq-local company-backends
  ;; 	      (append '((company-web-html))
  ;; 		      company-backends)))

(add-hook 'html-mode-hook 'my-html-setup)

;; lisp mode: electric-pair-mode, paredit-mode
(defun my-lisp-setup ()
  (enable-paredit-mode))

(add-hook 'lisp-mode-hook 'my-lisp-setup)
(add-hook 'clojure-mode-hook 'my-lisp-setup)
(add-hook 'scheme-mode-hook 'my-lisp-setup)
(add-hook 'emacs-lisp-mode-hook 'my-lisp-setup)
(add-hook 'cider-repl-mode-hook (lambda () (enable-paredit-mode)))

;; add .boot file to clojure auto mode list
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

;; rainbow-delimiters-mode
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; use ipython
(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args  "-i --simple-prompt")

;; cscope
(require 'xcscope)
(cscope-setup)

;; editorconfig
;; (require 'editorconfig)
;; (editorconfig-mode 1)

;; yaml mode
;; 已经定义过了
;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; git
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "custom-pkgs/")))
(require 'git)

;; anaconda-mode (python)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(defun flycheck-py-setup ()
  (when python-shell-virtualenv-root
    (let ((pylint-path (executable-find "pylint"))
	  (flake8-path (executable-find "flake8")))
      (when pylint-path
	(setq flycheck-python-pylint-executable pylint-path))
      (when flake8-path
	(setq flycheck-python-flake8-executable flake8-path)))))

(add-hook 'python-mode-hook 'flycheck-mode)

(add-hook 'flycheck-mode-hook 'flycheck-py-setup)

;; projectile
(projectile-mode)

;; OCaml setup
;; (autoload 'utop "~/.emacs.d/utop.el" "Toplevel for OCaml" t)
(let ((opam-exe (executable-find "opam")))
  (when opam-exe
    (print (concat "Found opam: " opam-exe))
    (let* ((share-dir (car (process-lines "opam" "config" "var" "share")))
	   (merlin-el-path (concat share-dir "/emacs/site-lisp/merlin.el"))
	   (utop-el-path (concat share-dir "/emacs/site-lisp/utop.el"))
	   (caml-el-path (concat share-dir "/emacs/site-lisp/caml.el"))
	   (tuareg-site-file-el-path (concat share-dir "/emacs/site-lisp/tuareg-site-file.el")))
      ;; add emacs site-lisp in opam share directory
      (push (concat share-dir "/emacs/site-lisp") load-path)
      ;; (print (concat "merlin.el " merlin-el-path))
      ;; (print (concat "utop.el " utop-el-path))
      (when (file-exists-p merlin-el-path)
	;; load merlin
	(print (concat "merlin.el found: " merlin-el-path))
	(setq merlin-command 'opam)
	(autoload 'merlin-mode "merlin" "Merlin mode" t)
	(add-hook 'tuareg-mode-hook 'merlin-mode))
      (when (file-exists-p utop-el-path)
	;; load utop
	(print (concat "utop.el found: " utop-el-path))
	(autoload 'utop "utop.el" "Toplevel for OCaml" t))
      (when (file-exists-p caml-el-path)
	;; load caml mode
	(print (concat "caml.el found: " caml-el-path))
	(autoload 'caml "caml.el" "Caml mode" t)
        (if window-system (require 'caml-font)))
      (when (file-exists-p tuareg-site-file-el-path)
	;; load tuareg
	(print (concat "tuareg-site-file.el found: " tuareg-site-file-el-path))
	(load tuareg-site-file-el-path)))))


;; Proof General
(load-file (concat user-emacs-directory "/lisp/PG/generic/proof-site.el"))
