;;; package --- init-themes.el
;;; Commentary:
;;;  Emacs configuration
;;;

;;; Code:

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))


;;; set default theme
(defun load-theme-dark()
  (interactive)
  (maybe-require-package 'material-theme)
  (when (require 'material-theme nil t)
    (load-theme 'material t)
    (message "load-theme 'material done.")))


(defun load-theme-light()
  (interactive)

  (maybe-require-package 'solarized-theme)
  (when (require 'solarized-theme nil t)
    (load-theme 'solarized-light t)      ; load solarized-theme first to set color for ident block markers
    (load-theme 'leuven)
    (message "load-theme 'leuven done.")))



(load-theme-dark)

(provide 'init-themes)
;;; init-themes.el ends here
