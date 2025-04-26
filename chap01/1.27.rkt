#lang eopl

(define flatten
  (lambda (slist)
    (if (null? slist)
        '()
        (if (symbol? (car slist))
            (cons (car slist) (flatten (cdr slist)))
            (append (flatten (car slist))
                    (flatten (cdr slist)))))))
