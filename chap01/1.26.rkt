#lang eopl

(define up
  (lambda (lst)
    (if (null? lst)
        '()
        (if (list? (car lst))
            (append (car lst)
                    (up (cdr lst)))
            (cons (car lst)
                  (up (cdr lst)))))))
