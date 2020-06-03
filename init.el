;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'auto-package-update)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b" "81c3852e1d8175b269375ed9f558db07c410a88ff1c1efd4129a708a9b62efa4" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" default)))
 '(package-selected-packages
   (quote
    (auto-package-update diff-hl go-projectile go-mode cyberpunk-theme sublimity persistent-soft ergoemacs-mode)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-diff-hl-mode)

;; Sublimity
(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)

;; Ergoemacs
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

;; Projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode 1)
