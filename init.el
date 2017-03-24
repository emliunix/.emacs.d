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
 '(cider-repl-display-help-banner nil)
 '(package-archives
   (quote
    (("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
 '(package-selected-packages
   (quote
    (syntax-subword shm racer company-racer rust-mode rustfmt markdown-mode markdown-mode+ cider geiser anaconda-mode auctex company-cabal company-ghc ghc flycheck-haskell haskell-snippets editorconfig emmet-mode ggtags helm-gtags paredit rainbow-delimiters xcscope yaml-mode zenburn-theme)))
 '(powerline-default-separator (quote wave))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :width normal :height 120)))))


(add-hook 'after-init-hook (lambda ()
			     (load "~/.emacs.d/package-init.el")))

;; ocaml mode
(add-to-list 'load-path  "~/.emacs.d/caml-mode/")

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
(autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
(add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

(if window-system (require 'caml-font))

;; highlight parenthesis
(show-paren-mode 1)
;; SubWord mode
; use syntax-subword instead
(global-subword-mode 1)

;; electric pair mode
(electric-pair-mode 1)

;; eldoc mode
(global-eldoc-mode 1)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-package-init-file ()
  (interactive)
  (find-file "~/.emacs.d/package-init.el"))
