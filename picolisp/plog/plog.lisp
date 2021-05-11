#!/usr/bin/picolisp /usr/lib/picolisp/lib.l

#;; Simple ColorLogTail

#;; see: https://susam.in/blog/lisp-in-vim-with-slimv-or-vlime/#get-started-with-paredit
#;; see: https://github.com/emezeske/paredit.vim/blob/master/doc/paredit.txt


#;; Str -> (T StartChunk) | (NIL NextChunk)
(de parse-line (Str)
   (cond
        ((let Ch (car (chop Str)) (or (= " " Ch) (= "^I" Ch) (= "^K" Ch))) (list NIL Str))
        (T (list T Str))))

(de parse (Handler)
    (let (Last NIL Idx 0)
      (until (eof)
             (let ((StartChunk? Str) (parse-line (line T)))
               #;; replace com.ceyoniq.nscale -> .
               (if (match (append '(@A) (chop "com.ceyoniq.nscale.") '(@B)) (chop Str))
                 (setq Str (pack @A "." @B)))

               (cond 
                 (StartChunk? (when Last 
                            (setq Idx (inc Idx)) 
                            (Handler (cons Idx Last))) 
                          (setq Last Str))

                 #;; filter some verbose stack traces (include only from "com.ceyoniq."
                 ((and (pre? "^Iat " Str) (not (pre? "^Iat com.ceyoniq." Str)))
                  (setq Last (pack Last ".")))
                 
                 (T (setq Last (pack Last "^J" Str))))))
      (when Last
        (Handler (cons Idx Last)))))

(de print-log (Log)
    (colorize-text (pack (pad 5 (car Log)) "$ ") 'black)
    (let Str (cdr Log)
      (cond
        ((sub? "ERROR" Str) (colorize-text Str 'red))
        ((or (sub? "WARN" Str) (sub? "WARNING" Str)) (colorize-text Str 'yellow))
        ((sub? "INFO" Str) (colorize-text Str 'blue))
        ((sub? "DEBUG" Str) (prin Str))
        (T (colorize-text Str 'magenta))))
    (prinl))

(de main ()
    (in NIL (parse print-log)))


#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#;; print to screen, using ncurses
#;;

#;; see: https://misc.flogisoft.com/bash/tip_colors_and_formatting
(de colorize-text (Str Color)
    (let Code (cadr (or
                    (find '((X) (= (car X) Color)) 
                          '((black 30) (red 31) (green 32) (yellow 33) (blue 34)
                                       (magenta 35) (cyan 36) (lightgray 37) (darkgray 90)))
                    '(black 0))) #; fallback to black
      (prin "^[[0;" Code "m"  Str "^[[0m")))


#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#;; main
(main)
(bye)  #; stop me

# vi:et:ts=2:sw=3
