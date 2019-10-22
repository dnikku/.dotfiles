;;; package --- init-eshell
;;; Commentary:
;;;

;;; Code:

(defun mysh-clear ()
  "Helper function to clear eshell screen."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(setenv
 "PATH"
 (mapconcat 'identity
            (list
             (expand-file-name "~/bin")
             (getenv "PATH"))
            (if *is-winnt* ";" ":")))

;;;
;; for windows: https://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html
;; for linux: apt-get install the_silver_searcher
(require-package 'ag)


(provide 'init-eshell)
;;; init-eshell ends here
