#lang eopl

; insert x into a sorted list
(define insert
  (lambda (pred x lst)
    (if (null? lst)
        (list x)
        (if (pred x (car lst))
            (cons x lst)
            (cons (car lst) (insert pred x (cdr lst)))))))

(define sort/predicate
  (lambda (pred lst)
    (if (null? lst)
        '()
        (insert pred (car lst) (sort/predicate pred (cdr lst))))))
