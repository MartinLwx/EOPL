#lang eopl

(define exist?
  (lambda (pred lst)
    (if (null? lst)
        #f
        (or (pred (car lst))
            (exist? pred (cdr lst))))))
