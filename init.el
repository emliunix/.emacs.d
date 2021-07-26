;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes '("ad5ba75e4e68800b50e9ac5557439ec749c2cfa86a8d024d5c1a31183d864dbf"))
 '(frame-background-mode 'dark)
 '(history-delete-duplicates t)
 '(lsp-haskell-process-path-hie "haskell-language-server-wrapper-Linux")
 '(lsp-keymap-prefix "C-c l")
 '(lsp-rust-analyzer-server-command '("~/.local/bin/rust-analyzer "))
 '(lsp-rust-analyzer-server-display-inlay-hints t)
 '(lsp-rust-server 'rust-analyzer)
 '(lsp-semantic-highlighting :deferred)
 '(package-archives '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
 '(ring-bell-function 'ignore)
 '(show-paren-mode t)
 '(size-indication-mode t))

(add-hook 'after-init-hook (lambda ()
			     (require 'package-init)
			     (package-init)))
;; (package-init)

;; lean4
(defun lean4-init ()
  (let ((lean4-mode-path (concat (file-name-as-directory user-emacs-directory) "lean4-mode")))
    (when (file-exists-p lean4-mode-path)
      (add-to-list 'load-path (concat (file-name-as-directory user-emacs-directory) "lean4-mode"))
      (let ((lean4-mode-required-packages '(dash f flycheck lsp-mode magit-section s))
	    (need-to-refresh t))
	(dolist (p lean4-mode-required-packages)
	  (when (not (package-installed-p p))
	    (when need-to-refresh
              (package-refresh-contents)
              (setq need-to-refresh nil))
	    (package-install p))))
      (require 'lean4-mode))))

(add-hook 'after-init-hook #'lean4-init)

(add-hook 'after-init-hook
	  (lambda ()
	    (load-theme 'zenburn)))
