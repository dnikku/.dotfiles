;;; package --- init-web-mode
;;; Commentary: alternative to javascript-mode
;;; Initialize web-mode

;;; Code:
(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))


(add-hook 'web-mode-hook
          (lambda ()
            (if (equal web-mode-content-type "javascript")
                (web-mode-set-content-type "jsx")
              (message "now set to: %s" web-mode-content-type))

            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-code-indent-offset 2)
            (setq web-mode-enable-block-face t)
            ))

(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 2)
            ))

(provide 'init-web-mode)
;;; init-web-mode.el ends here
