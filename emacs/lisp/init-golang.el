;;; init-golang.el --- Setup go mode
;;; Commentary:
;;; Initialize go mode

;;; Code:

(when (maybe-require-package 'go-mode)
  (require 'go-mode-autoloads)

  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save)
              (setq tab-width 2)
              (setq indent-tabs-mode 1)
              (local-set-key (kbd "C-c j") #'godef-jump)
              ))

  (require-package 'auto-complete)
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default)
  )


(provide 'init-golang)
;;; init-golang.el ends here
