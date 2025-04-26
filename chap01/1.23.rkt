#lang eopl

(define list-index-helper
  (lambda (idx pred lst)
    (if (null? lst)
        #f
        (if (pred (car lst))
            idx
            (list-index-helper (+ idx 1) pred (cdr lst))))))

(define list-index
  (lambda (pred lst)
    (list-index-helper 0 pred lst)))
