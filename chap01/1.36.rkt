#lang eopl

(define g cons)

(define number-elements
  (lambda (lst)
    (if (null? lst)
        '()
        (g (list 0 (car lst))
           (number-elements (cdr lst))))))
