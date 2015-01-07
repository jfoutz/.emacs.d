;;; cribbed from https://github.com/jordonbiondo/.emacs.d/blob/master/init.el


;; initial setup
(setq visible-bell 1)

(tool-bar-mode -1)

;; package manager configuration
(mapc (lambda (p) (push p load-path))
      '("~/.emacs.d/use-package/"))

(require 'use-package)
(require 'package)

(mapc (lambda(p) (push p package-archives))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-refresh-contents)
(package-initialize)

;; packages

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :init
  (progn
    (helm-mode))
