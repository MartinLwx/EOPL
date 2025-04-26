#lang eopl

(define swapper
  (lambda (s1 s2 slist)
    (if (null? slist)
        '()
        (let ((sexp (car slist))
              (rest (cdr slist)))
          (if (symbol? sexp)
              (cons (cond ((eqv? sexp s1) s2)
                          ((eqv? sexp s2) s1)
                          (else sexp))
                    (swapper s1 s2 rest))
              (cons (swapper s1 s2 sexp)
                    (swapper s1 s2 rest)))))))
