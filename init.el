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
   (quote
    ("a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil)
 '(lsp-rust-server (quote rust-analyzer))
 '(package-archives
   (quote
    (("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
 '(package-selected-packages
   (quote
    (lsp-mode lsp-python-ms lsp-ui pretty-mode helm-idris idris-mode restclient restclient-helm auctex cider clojure-mode company-cabal company-ghc dockerfile-mode emmet-mode flycheck-haskell geiser ggtags haskell-snippets helm helm-cider helm-ghc helm-projectile idle-highlight-mode intero json-mode markdown-mode+ paredit projectile rainbow-delimiters rust-mode sml-mode syntax-subword toml-mode xcscope yaml-mode zenburn-theme)))
 '(projectile-completion-system (quote helm))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; load user customs
;; (let ((file-custom-el (concat (file-name-as-directory user-emacs-directory) "my-custom.el")))
;;   (when (file-exists-p file-custom-el)
;;     (load file-custom-el)))

(add-hook 'after-init-hook
          (lambda ()
	    (load (concat (file-name-as-directory user-emacs-directory) "package-init.el"))))

;; elpa mirror backup in case tuna is not accessible
;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; ocaml mode
;; (add-to-list 'load-path  "~/.emacs.d/caml-mode/")

;; (add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
;; (autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
;; (autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
;; (autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
;; (add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
;; (add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

;; (if window-system (require 'caml-font))

;; end ocaml mode

;; highlight parenthesis
(show-paren-mode 1)
; use syntax-subword instead
(global-subword-mode 1)
;; electric pair mode
(electric-pair-mode 1)
;; eldoc mode
(global-eldoc-mode 1)
;; global-hl-line-mode
(global-hl-line-mode 1)
;; savehist
(savehist-mode 1)

(defun open-init-file ()
  (interactive)
  (find-file (concat (file-name-as-directory user-emacs-directory) "init.el")))

(defun open-package-init-file ()
  (interactive)
  (find-file (concat (file-name-as-directory user-emacs-directory) "package-init.el")))
