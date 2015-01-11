

;; initial setup
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq visible-bell 1)

;; package manager configuration
(mapc (lambda (p) (push p load-path))
      '("~/.emacs.d/use-package/"
	"~/.emacs.d/cedet/"))

(require 'use-package)
(require 'package)
(require 'cedet-devel-load)

(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))
; FIXME need a way to do this regularly, but not every launch
(package-refresh-contents)
(package-initialize)

;; packages

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini)
   ("C-c h g" . helm-google-suggest))
  :init
  (progn
    (setq helm-M-x-fuzzy-match t
	  helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match t)
    (helm-mode)))

(use-package projectile
  :ensure t
  :init
  (progn
    (projectile-global-mode)))

(use-package helm-projectile
  :ensure t)

(use-package flycheck
  :ensure t)

; groovy mode issue - remove someday
(require 'cl)

(use-package groovy-mode
  :ensure t
  :pin melpa);seems weird on marmalade

(use-package malabar-mode
  :ensure t
  :pin melpa
  :init
  (progn
    (activate-malabar-mode)
    (add-hook 'malabar-java-mode-hook 'flycheck-mode)
    (add-hook 'malabar-groovy-mode-hook 'flycheck-mode)))

;; built in package config
;; org mode
(setq org-agenda-files '("~/Documents/animated-ironman/org"))

