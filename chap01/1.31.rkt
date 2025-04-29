#lang eopl

(define leaf
  (lambda (x)
    x))

(define interior-node
  (lambda (s left right)
    (list s left right)))

(define leaf?
  (lambda (x)
    (not (list? x))))

(define lson
  (lambda (tree)
    (cadr tree)))

(define rson
  (lambda (tree)
    (caddr tree)))

(define contents-of
  (lambda (node)
    (if (leaf? node)
        node
        (car node))))
