;;; Make some sources readonly
(dir-locals-set-class-variables
 'unwritable-directory
 '((nil . ((buffer-read-only . t)))))
(when *is-linux*
  (dir-locals-set-directory-class "/home/dnikku/projects/oa2b/ve" 'unwritable-directory))
(when *is-winnt*
  (dir-locals-set-directory-class "F:/dnikku/tools" 'unwritable-directory))
