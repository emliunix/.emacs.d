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
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (yaml-mode sicp shm flycheck-haskell flycheck rainbow-delimiters company-cabal company-web spaceline zenburn-theme xcscope syntax-subword swiper-helm solarized-theme projectile pretty-mode paredit mode-icons idle-highlight-mode helm-zhihu-daily helm-gtags haskell-snippets ggtags eyebrowse evalator emoji-cheat-sheet-plus emmet-mode electric-operator editorconfig company-math company-ghc auctex anaconda-mode)))
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
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :width normal)))))


(add-hook 'after-init-hook (lambda ()
			     (load "~/.emacs.d/package-init.el")))
;; highlight parenthesis
(show-paren-mode 1)
;; SubWord mode
; use syntax-subword instead
;(global-subword-mode 1)

;; electric pair mode
(electric-pair-mode 1)

;; eldoc mode
(global-eldoc-mode 1)
