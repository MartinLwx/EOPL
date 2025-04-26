#lang eopl

(define subst
  (lambda (new old slist)
    (if (null? slist)
        '()
        (if (symbol? (car slist))
            (cons (if (eqv? (car slist) old) new (car slist))
                  (subst new old (cdr slist)))
            (cons (subst new old (car slist))
                  (subst new old (cdr slist)))))))
