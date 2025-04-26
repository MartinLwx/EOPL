#lang eopl

; insert x into a sorted list
(define insert
  (lambda (x lst)
    (if (null? lst)
        (list x)
        (if (< x (car lst))
            (cons x lst)
            (cons (car lst) (insert x (cdr lst)))))))

(define sort
  (lambda (lst)
    (if (null? lst)
        '()
        (insert (car lst) (sort (cdr lst))))))
