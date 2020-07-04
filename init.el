
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell 1)
(setq calendar-week-start-day 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)

;; Tell straight to install the package for each use-package declaration
(setq straight-use-package-by-default t)

;; Ergoemacs
(use-package ergoemacs-mode
  :init
  (setq ergoemacs-keyboard-layout "us")
  :config
  (ergoemacs-mode 1))

(use-package org
  :straight nil
  :init
  (setq org-directory "~/org")
  (setq org-agenda-files `("~/org"))
  (setq org-refile-targets `(org-agenda-files :maxlevel . 9))
  (setq org-agenda-start-on-weekday 1))

(use-package visual-line-mode
  :straight nil
  :hook org-mode)

;; Helm
(use-package helm
  :config
  (helm-mode 1))

(use-package doom-themes
  :init (load-theme `doom-one t))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
