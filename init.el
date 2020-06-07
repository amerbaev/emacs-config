(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell 1)
;; (require 'sublimity-scroll)
;; (sublimity-mode 1)

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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

(straight-use-package 'use-package)
(require 'use-package)

;; Tell straight to install the package for each use-package declaration
(setq straight-use-package-by-default t)

;; Ergoemacs
(use-package ergoemacs-mode
  :init
  ;; (setq ergoemacs-theme nil)
  (setq ergoemacs-keyboard-layout "us")
  :config
  (ergoemacs-mode 1))

(use-package org
  :init
  (setq org-directory "~/notes")
  (setq org-agenda-files `("~/notes"))
  (setq org-refile-targets `(org-agenda-files :maxlevel . 9)))

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
 ;; '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 )

;; (global-diff-hl-mode)

;; Projectile
;; (use-package projectile
;;   :bind (("s-p" . projectile-command-map)
;; 	 ("C-c p" . projectile-command-map))
;;   :config
;;   (projectile-mode 1))

;; Helm
(use-package helm
  :config
  (helm-mode 1))

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package writeroom-mode)
