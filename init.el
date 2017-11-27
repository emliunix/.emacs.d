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
 '(indent-tabs-mode nil)
 '(package-archives
   (quote
    (("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
 '(package-selected-packages
   (quote
    (aria2 auctex cider clojure-mode company-cabal company-ghc company-racer dockerfile-mode elpy emmet-mode flycheck-haskell flycheck-rust geiser ggtags haskell-snippets helm helm-cider helm-ghc helm-projectile idle-highlight-mode intero json-mode markdown-mode+ paredit projectile projectile-codesearch projectile-direnv projectile-sift projectile-speedbar racer rainbow-delimiters rust-mode sml-mode syntax-subword toml-mode xcscope yaml-mode zenburn-theme)))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "等距更纱黑体 SC" :foundry "CYEL" :slant normal :weight normal :width normal :height 120)))))


(add-hook 'after-init-hook (lambda ()
			     (load "~/.emacs.d/package-init.el")))

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

