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
  :straight nil
  :init
  (setq org-directory "~/notes")
  (setq org-agenda-files `("~/notes"))
  (setq org-refile-targets `(org-agenda-files :maxlevel . 9)))

(use-package visual-line-mode
  :straight nil
  :hook org-mode)

(use-package writeroom-mode
  :hook org-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(writeroom-fullscreen-effect (quote maximized))
 '(writeroom-global-effects
   (quote
    (writeroom-set-alpha writeroom-set-tool-bar-lines writeroom-set-vertical-scroll-bars)))
 '(writeroom-mode-line t)
 '(writeroom-width 120))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

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
