#lang eopl

(define count-occurrences
  (lambda (s slist)
    (if (null? slist)
        0
        (let ((sexp (car slist))
              (rest (cdr slist)))
          (+ (if (symbol? sexp)
                 (if (eqv? sexp s) 1 0)
                 (count-occurrences s sexp))
             (count-occurrences s rest))))))
