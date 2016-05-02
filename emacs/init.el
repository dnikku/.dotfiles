;;; package --- init.el
;;; Commentary:
;;;  Emacs configuration
;;;

;;; Code:

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
(defalias 'yes-or-no-p 'y-or-n-p)


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
