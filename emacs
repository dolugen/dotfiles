(setenv "PATH"
  (concat
    "/home/d/w/dotfiles/scripts"
    (getenv "PATH")
  ))
(require 'cl)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defvar dolugen/packages '(ace-jump-mode
                          ace-window
                          auto-complete
                          autopair
                          deft
                          discover
                          flycheck
                          jedi
                          magit
                          minimap
                          nav
                          org
                          paredit
                          powerline
                          restclient
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

;; Look and feel
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(load-theme 'wombat t)

;; turn off bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; intuitive selection
(delete-selection-mode t)
(setq x-select-enable-clipboard t)

;; line numbers
(global-linum-mode t)

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

(require 'discover)
(global-discover-mode 1)

(setq redisplay-dont-pause t)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;(set-face-foreground 'hl-line "#333333")
;(set-face-foreground 'highlight nil)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)

(require 'powerline)
(powerline-default-theme)

 (global-set-key (kbd "M-p") 'ace-window)
