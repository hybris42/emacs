;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get installation and loading ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install (if needed) and load

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

;; add el-get.* as keywords
(font-lock-add-keywords 'emacs-lisp-mode '(("el-get[^ ]*" . font-lock-keyword-face)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  bundles and customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; languages
(el-get-bundle adoc-mode)
(el-get-bundle apache-mode)
(el-get-bundle crontab-mode)
(el-get-bundle debian-changelog-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle json-mode)
(el-get-bundle lua-mode)
(el-get-bundle yaml-mode)
(el-get-bundle markdown-mode)
(setq markdown-command "/usr/bin/pandoc")
(show-paren-mode)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '(".*\\.ini$" . conf-mode))
(add-to-list 'auto-mode-alist '(".*\\.service$" . conf-mode))
(setq-default indent-tabs-mode nil)
(add-to-list 'auto-mode-alist '("/home/hybris/dev/bearstech/bearstech/infra/service/dns/master/zones/" . dns-mode))

;; SSH agent
(el-get-bundle keychain-environment)
(require 'keychain-environment)
(setq tramp-default-method "ssh")

;; fixme mode
(el-get-bundle fic-mode)
(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; backup saves
(el-get-bundle backup-each-save)
(require 'backup-each-save)
(add-hook 'after-save-hook 'backup-each-save)
(setq backup-each-save-mirror-location "~/.emacs.backups")
(setq make-backup-files nil)
(setq backup-each-save-remote-files t)

;; better file management
(el-get-bundle neotree)
(el-get-bundle all-the-icons)
(require 'all-the-icons)
(setq neo-theme 'icons)
(setq neo-show-hidden-files t)
(defun neotree-hide-line-numbers (_unused)
  (linum-mode -1))
(add-hook 'neo-after-create-hook 'neotree-hide-line-numbers)
(setq neo-autorefresh nil)
(global-set-key "\C-o" 'neotree-refresh)

;; shortkeys to switch between windows
(el-get-bundle windcycle)

;; file finder
(el-get-bundle find-file-in-project)
(autoload 'find-file-in-project "find-file-in-project" nil t)
(global-set-key "\C-xf" 'find-file-in-project)
(global-set-key "\C-xd" 'find-file-in-current-directory)

;; ido everywhere
(el-get-bundle ido-ubiquitous)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;; smex
(el-get-bundle smex)
(global-set-key (kbd "M-x") 'smex)

;; completion
(el-get-bundle company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "<M-RET>") 'company-complete)

;; zoom current window
(el-get-bundle zoom-window)
(global-set-key "\C-xz" 'zoom-window-zoom)

;; theme
(el-get-bundle color-theme-ir-black (color-theme-ir-black))
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(menu-bar-mode -99)
(tool-bar-mode -1)
(set-face-attribute 'vertical-border nil :foreground "#222222")
(set-face-background 'fringe "#000000")
(set-face-attribute 'default nil :height 100)
(setq-default show-trailing-whitespace t)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;; scroll-bar
(el-get-bundle yascroll)
(scroll-bar-mode 0)
(global-yascroll-bar-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(yascroll:thumb-fringe ((t (:background "white" :foreground "white")))))

;; highlight line number
(el-get-bundle tom-tan/hlinum-mode)
(global-linum-mode)
(setq linum-format "%4d ")
(hlinum-activate)
(global-hl-line-mode 1)

;; better status bar
(el-get-bundle powerline)
(powerline-default-theme)

;; 80 columns limit
(el-get-bundle fill-column-indicator)
(setq fci-rule-column 80)

;; never kill emacs
(global-set-key "\C-x\C-c" 'kill-this-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (notmuch minimap))))
