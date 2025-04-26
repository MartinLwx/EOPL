#lang eopl

(define duple
  (lambda (n x)
    (if (eqv? n 0)
        '()
        (cons x (duple (- n 1) x )))))
