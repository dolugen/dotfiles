(require 'cl)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(defvar dolugen/packages '(
                           ace-window
                           auto-complete
                           autopair
                           avy
                           discover
			   dracula-theme
                           editorconfig
			   elpy
                           expand-region
                           flycheck
                           flycheck-swift3
                           helm
                           helm-ls-git
                           magit
                           neotree
			   npm-mode
                           restclient
			   rjsx-mode
			   rotate
                           smooth-scrolling
			   swift-mode
                           yasnippet
                          )
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

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(require 'dracula-theme
(load-theme 'dracula t)

(menu-bar-mode 0)
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  )

(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'elpy-enable)

(global-linum-mode t)

(show-paren-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks t)

(require 'expand-region)
(require 'neotree)
(require 'discover)
(global-discover-mode 1)
(setq redisplay-dont-pause t)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(require 'autopair)
(autopair-global-mode)

(require 'auto-complete)
(global-auto-complete-mode)

(require 'smooth-scrolling)
(smooth-scrolling-mode)

;(require 'rainbow-delimiters)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'helm-config)
(helm-mode t)
(setq helm-ff-newfile-prompt-p nil)

(require 'helm-ls-git)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-x t") 'rotate-window)
(global-set-key (kbd "M-!") 'eshell-command)
(global-set-key [f7] 'neotree-toggle)
(global-set-key [f8] 'hs-toggle-hiding)
(global-set-key [f9] 'elpy-django-runserver)
(global-set-key [f10] 'npm-mode-npm-run)
(global-set-key (kbd "C-c o") 'occur)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(elpy-django-command "python backend/tools/manage.py")
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (npm-mode elpy rjsx-mode rotate discover ace-window avy smooth-scrolling flycheck-swift3 flycheck editorconfig autopair auto-complete yasnippet restclient expand-region neotree magit helm-ls-git helm swift-mode)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(pyvenv-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ffff7fff0000")
     (60 . "#ffffbfff0000")
     (80 . "#b58900")
     (100 . "#ffffffff0000")
     (120 . "#ffffffff0000")
     (140 . "#ffffffff0000")
     (160 . "#ffffffff0000")
     (180 . "#859900")
     (200 . "#aaaaffff5555")
     (220 . "#7fffffff7fff")
     (240 . "#5555ffffaaaa")
     (260 . "#2aaaffffd554")
     (280 . "#2aa198")
     (300 . "#0000ffffffff")
     (320 . "#0000ffffffff")
     (340 . "#0000ffffffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
