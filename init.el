

;; initial setup
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq visible-bell 1)

;; package manager configuration
(mapc (lambda (p) (push p load-path))
      '("~/.emacs.d/use-package/"))

(require 'use-package)
(require 'package)

(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
; FIXME need a way to do this regularly, but not every launch
(package-refresh-contents)
(package-initialize)

;; packages

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :init
  (progn
    (helm-mode)))

(use-package projectile
  :ensure t)

;; built in package config
;; org mode
(setq org-agenda-files '("~/Documents/animated-ironman/org"))

