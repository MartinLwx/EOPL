#lang eopl

(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (let ((head (car lst))
              (rest (cdr lst)))
          (cons (list (cadr head) (car head))
                (invert rest))))))
