(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; turn off welcome screen
(setq inhibit-startup-message t)

;; turn off bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; line numbers
(global-linum-mode t)

;; turn on parentheses highlighting
(show-paren-mode)

;; hilight current line
(global-hl-line-mode t)

;; indent
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;;turn on highlight changes
(highlight-changes-mode t)

(require 'minimap)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-mode t)
 '(minimap-window-location (quote right)))

;; Load emacs-nav
(add-to-list 'load-path "~/.emacs.d/nav/")
(require 'nav)

(require 'discover)
(global-discover-mode 1)

(setq redisplay-dont-pause t)
