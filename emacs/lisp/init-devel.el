;;; package --- init-devel.el
;;; Commentary:
;;;

;;; Code:

;;; clean whitespace
;;(require-package 'whitespace-cleanup-mode)
;;(global-whitespace-cleanup-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(maybe-require-package 'flycheck)
(global-flycheck-mode)

;;(require-package 'rainbow-delimiters)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(define-key global-map (kbd "RET") 'newline-and-indent)


;;; Nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;;; undo-tree
(require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)


;;; programing lang modes
(require 'init-python)
(require 'init-web-mode)

;;;(require 'init-golang)
(require 'init-git)



(provide 'init-devel)
;;; init-devel ends here
