;;; package --- init-python
;;; Commentary:
;;; @see: https://realpython.com/blog/python/emacs-the-best-python-editor
;;; @see: https://emacswiki.org/emacs/PythonProgrammingInEmacs
;;; @see: https://elpy.readthedocs.io/en/latest/index.html

;;; Code:

(require-package 'pyvenv)
(require-package 'elpy)

(elpy-enable)
;;(elpy-use-ipython)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(maybe-require-package 'py-autopep8)
(when (require 'py-autopep8 nil t)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))


(after-load 'elpy
  (define-key elpy-mode-map (kbd "C-c j") 'elpy-goto-definition))


(provide 'init-python)
;;; init-python ends here
