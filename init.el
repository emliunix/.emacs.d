(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(add-to-list 'load-path (concat (file-name-as-directory user-emacs-directory) "idris2-mode"))
(require 'idris2-mode)

;; (add-to-list 'load-path "~/play/nix-mode/")
;; (require 'nix-mode)

;; lsp idris2
(require 'lsp-mode)
;; (add-to-list 'lsp-language-id-configuration '(idris2-mode . "idris2"))
;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-stdio-connection
;; 				   "/home/YuhuiLiu/play/idris2-lsp/build/exec/idris2-lsp-wrapped.sh")
;; 		  :activation-fn (lsp-activate-on "idris2")
;; 		  :server-id 'idris2-lsp))

;; emoji
(when window-system
    (set-fontset-font t 'symbol "Noto Color Emoji"))
