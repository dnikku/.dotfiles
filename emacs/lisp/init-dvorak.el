;;; package --- init-dvorak
;;; Commentary:
;;;

;;; Code:

(global-unset-key (kbd "C-x C-c")) ;; disable exit short key
(global-unset-key (kbd "C-x m")) ;; disable compose mail, cause not used

;; dvorak acomodation C-x <---> C-u
(keyboard-translate ?\C-x ?\C-u)
(keyboard-translate ?\C-u ?\C-x)

(add-hook 'after-make-frame-functions ; handle also when using emacsclient, as diff frame
          (lambda (f) (with-selected-frame f
                        (keyboard-translate ?\C-x ?\C-u)
                        (keyboard-translate ?\C-u ?\C-x)
                        )))

;; M-x ---> C-x C-m
(global-set-key "\C-x\C-m" 'execute-extended-command)

;; C-x f -> find-file
(global-set-key (kbd "C-x f") 'find-file)

(provide 'init-dvorak)
;;; init-dvorak ends here
