;;; package --- init.el
;;; Commentary:
;;;  Emacs configuration
;;;

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(switch-to-buffer "*Messages*")

(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-winnt* (or (equal system-type 'windows-nt)
                           (equal system-type 'cygwin)))

;; Boostrap load-path to ./lisp
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-private-file (expand-file-name ".private.el" user-emacs-directory))


(require 'init-dvorak)

;; Global configuration
(setq inhibit-startup-message t) ;; hide the startup message
(setq ring-bell-function 'ignore) ;; turn off alarms
(global-hl-line-mode 1) ;; global highlight current line
(setq column-number-mode t) ;; show column
(menu-bar-mode -1) ;; hide menu bar
(tool-bar-mode -1) ;; hide tool bar
(scroll-bar-mode -1) ;; hide scroll bar
(defalias 'yes-or-no-p 'y-or-n-p)
(set-face-attribute 'default nil :height 120) ;; increase font-size

;; disable C-z
(global-unset-key (kbd "C-z"))


(require 'init-utils)
(require 'init-package)
(require-package 'better-defaults)

(require-package 'diminish)

(require 'init-themes)
(require 'init-eshell)
(require 'init-windows)
(require 'init-sessions)

(require 'init-devel)


;;; load variables set via 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))

;;; load private variables
(when (file-exists-p custom-private-file)
  (load custom-private-file))

(message "init done.")

(provide 'init)
;;; init.el ends here
