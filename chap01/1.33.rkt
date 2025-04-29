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

(define mark-leaves-with-red-depth-helper
  (lambda (x cnt)
    (if (leaf? x)
        (leaf cnt)
        (if (eqv? (contents-of x) 'red)
            (interior-node (contents-of x)
                           (mark-leaves-with-red-depth-helper (lson x) (+ 1 cnt))
                           (mark-leaves-with-red-depth-helper (rson x) (+ 1 cnt)))
            (interior-node (contents-of x)
                           (mark-leaves-with-red-depth-helper (lson x) cnt)
                           (mark-leaves-with-red-depth-helper (rson x) cnt))))))

(define mark-leaves-with-red-depth
  (lambda (x)
    (mark-leaves-with-red-depth-helper x 0)))

(define test (interior-node 'red
                            (interior-node 'bar
                                           (leaf 26)
                                           (leaf 12))
                            (interior-node 'red
                                           (leaf 11)
                                           (interior-node 'quux
                                                          (leaf 117)
                                                          (leaf 14)))))
