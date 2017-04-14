;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get installation and loading ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; install (if needed) and load
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
(el-get-bundle lua-mode)
(show-paren-mode)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;; backup saves
(el-get-bundle backup-each-save)
(require 'backup-each-save)
(add-hook 'after-save-hook 'backup-each-save)
(setq backup-each-save-mirror-location "~/.emacs.backups")
(setq make-backup-files nil)

;; better file management
(el-get-bundle nav)
(require 'nav)
(setq nav-filtered-p nil)
(nav-disable-overeager-window-splitting)
(global-set-key "\C-o" 'nav-toggle)

;; shortkeys to switch between windows
(el-get-bundle windcycle)

;; file finder
(el-get-bundle find-file-in-project)
(autoload 'find-file-in-project "find-file-in-project" nil t)
(global-set-key "\C-xf" 'find-file-in-project)
(global-set-key "\C-xd" 'find-file-in-current-directory)

;; edit text from chrome
(el-get-bundle edit-server)
(setq edit-server-host "127.0.0.1")
(edit-server-start)

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

;; theme
(el-get-bundle color-theme-ir-black (color-theme-ir-black))
(menu-bar-mode -99)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(set-face-attribute 'vertical-border nil :foreground "#222222")
(set-face-background 'fringe "#000000")
(set-face-attribute 'default nil :height 70)
(setq-default show-trailing-whitespace t)

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
