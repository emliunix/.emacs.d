
;; company mode backends
(global-company-mode)
(add-to-list 'company-backends 'company-ghc)
(add-to-list 'company-backends 'company-math-symbols-unicode)

;; smex
;(require 'smex)
;(smex-initialize)
;
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-x") 'smex-major-mode-commands)
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

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
(load-theme 'zenburn t)

;; powerline
(powerline-default-theme)

;; haskell-mode-hook
(defun my-haskell-setup ()
  (haskell-doc-mode)
  (haskell-indentation-mode)
  (interactive-haskell-mode +1)
  (setq-local company-backends
	      (append '((company-ghc company-cabal))
		      company-backends)))
  
(add-hook 'haskell-mode-hook 'my-haskell-setup)

;; AucTeX mode company-math
(defun my-TeX-setup ()
  (setq-local company-backends
	      (append '((company-math-symbols-latex company-latex-commands))
		      company-backends)))

(add-hook 'TeX-mode-hook 'my-TeX-setup)

;; idle-highlight-mode
;; 并不能够自动开启，还是需要手动的打开，所以干脆不开了吧
;(idle-highlight-mode 1)

;; pretty-mode
;; 好像有点性能问题
;(global-pretty-mode 1)

;; syntax-subword-mode
(global-syntax-subword-mode 1)

;; emmet
(defun my-html-setup ()
  (emmet-mode t)
  (setq-local company-backends
	      (append '((company-web-html))
		      company-backends)))

(add-hook 'html-mode-hook 'my-html-setup)

;; lisp mode: electric-pair-mode, paredit-mode
(defun my-lisp-setup ()
  (enable-paredit-mode))

(add-hook 'lisp-mode-hook 'my-lisp-setup)

;; rainbow-delimiters-mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; yaml mode
;; 已经定义过了
;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; use ipython
(setq python-shell-interpreter "ipython")
