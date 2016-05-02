;;; package --- init-themes.el
;;; Commentary:
;;;  Emacs configuration
;;;

;;; Code:

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))


;;; set default theme
(load-theme 'zenburn t) ;; nice

;; (maybe-require-package 'material-theme)
;; (when (require 'material-theme nil t)
;;   (load-theme 'material t)
;;   (message "load-theme 'material done."))

(provide 'init-themes)
;;; init-themes.el ends here
