;;; package --- init-lisp.el
;;; Commentary:
;;;

;;; Code:

;; (require-package 'rainbow-delimiters)
(require-package 'paredit)
(require-package 'highlight-parentheses)

;; customize highlight-parentheses
(setq hl-paren-colors
      '("white" "white" "white" "white" "white"))

(setq hl-paren-background-colors
      '("dark green" "cadet blue" "olive drab" "dark cyan" "royal blue"))


;; scheme-mode
(add-to-list 'auto-mode-alist '("\\.ss$" . scheme-mode))
(add-hook 'scheme-mode-hook
          (lambda ()
            ;; (paredit-mode +1) ;; Loads paredit mode automatically
	    (highlight-parentheses-mode)))


(provide 'init-lisp)
;;; init-lisp ends here
