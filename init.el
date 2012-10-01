(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; required because of a package.el bug
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(ack-and-a-half
    clojure-mode
    ido-ubiquitous
    nrepl
    magit
    markdown-mode
    paredit
    puppet-mode
    smex
    undo-tree
    volatile-highlights
    zenburn-theme))

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun my-install-packages ()
  (unless (my-packages-installed-p)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p my-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(my-install-packages)

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(setq evil-normal-state-cursor '("grey" box))
(setq evil-insert-state-cursor '("green" bar))
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode 1)
(set-default 'imenu-auto-rescan t)
(icomplete-mode +1) ;; auto-completion in minibuffer

;; Recentf
(setq recentf-max-saved-items 150
      recentf-max-menu-items 15)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c f") 'recentf-ido-find-file)
(recentf-mode t)

(show-paren-mode +1)
(setq show-paren-style 'parenthesis)

 ;; highlight the current line
(global-hl-line-mode +1)
;; light theme
;(set-face-background hl-line-face "grey96")
;; dark theme
(set-face-background hl-line-face "grey30")

;; Ido
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point nil
      ido-max-prospects 8
      ido-ignore-buffers
       '("\\` " "^\\*"))

;;(setq ido-ignore-buffers '("^\\s-" "^\\*" "TAGS$"))
(ido-mode 1)
(ido-ubiquitous 1)

(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;(setq make-backup-files nil) 

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; Haskell
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")

(require 'volatile-highlights)

(require 'surround)
(global-surround-mode 1)

;; Ack
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; Smex: better M-x minibuffer prompt
(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-,") 'smex)
