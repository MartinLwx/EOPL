#lang eopl

(define product-helper
  (lambda (s sos2)
    (if (null? sos2)
        '()
        (cons (list s (car sos2))
              (product-helper s (cdr sos2))))))

(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
        '()
        (append (product-helper (car sos1) sos2)
                (product (cdr sos1) sos2)))))
