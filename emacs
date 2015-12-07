;; -*- mode: emacs-lisp -*-
(setenv "PATH"
  (concat
    (expand-file-name "~/w/dotfiles/scripts:")
    (getenv "PATH")
  ))
(require 'cl)

(require 'package)
(package-initialize)

;; ARCHIVES
(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; TOOLKIT
(defvar dolugen/packages '(ace-jump-mode
                          ace-window
                          auto-complete
                          autopair
                          darktooth-theme
                          deft
                          discover
                          flycheck
                          flycheck-pyflakes
                          magit
                          nav
                          org
                          paredit
                          powerline
                          rainbow-mode
                          restclient
                          rotate
                          yasnippet
                          web-mode)
  "Default packages")

(defun dolugen/packages-installed-p ()
  (loop for pkg in dolugen/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (dolugen/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg dolugen/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; LOOK AND FEEL
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(load-theme 'darktooth t)

;; turn off bars
(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
)

;; intuitive selection
(delete-selection-mode t)
(setq x-select-enable-clipboard t)

;; line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502")

(defun nolinum ()
  (global-linum-mode 0)
)
;(add-hook 'org-mode-hook 'nolinum)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

;; turn on parentheses highlighting
(show-paren-mode)

;; hilight current line
(global-hl-line-mode t)

;; indent
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; CONFIGURE PACKAGES

(setq tramp-default-method "ssh")
(eval-after-load 'tramp
  '(vagrant-tramp-enable))

(require 'discover)
(global-discover-mode 1)

(setq redisplay-dont-pause t)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)

;; auto pair parens
(require 'autopair)
(autopair-global-mode)

;; only in X mode
(when (display-graphic-p)
  ;; status line love
  (require 'powerline)
  (powerline-default-theme)
)

;; trying abbrev mode
(setq save-abbrevs t)
(setq-default abbrev-mode t)

(yas-global-mode 1)

(defun bolor-query (x)
  (interactive "sSearch Bolor Toli: ")
  (eshell-command (format "bolor %s" x))
)

;; KEYBOARD BINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-x t") 'rotate-window)
(global-set-key (kbd "M-!") 'eshell-command)
(global-set-key (kbd "C-*") 'bolor-query)

(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-visual-commands (quote ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm" "htop"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
