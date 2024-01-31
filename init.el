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
 '(package-selected-packages
   '(flycheck magit all-the-icons yasnippet company rainbow-delimiters project eglot lsp-haskell lsp-python-ms pretty-mode helm-idris idris-mode restclient restclient-helm auctex dockerfile-mode emmet-mode geiser helm helm-projectile json-mode markdown-mode+ paredit projectile rust-mode sml-mode syntax-subword toml-mode yaml-mode zenburn-theme))
 '(projectile-completion-system 'helm)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

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

;; elpa mirror backup in case tuna is not accessible
;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))

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
