#lang eopl

(define path
  (lambda (val bst)
    (cond ((null? bst) '())
          ((eqv? val (car bst)) '())
          ((< val (car bst)) (cons 'left (path val (cadr bst))))
          ((> val (car bst)) (cons 'right (path val (caddr bst)))))))
