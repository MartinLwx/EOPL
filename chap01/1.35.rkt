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

(define number-leaves-helper
  (lambda (x val)
    (if (leaf? x)
        (cons (leaf val) (+ 1 val))
        (let* ((ltree (lson x))
               (rtree (rson x))
               (ltree-and-val (number-leaves-helper ltree val))
               (new-ltree (car ltree-and-val))
               (new-val (cdr ltree-and-val))
               (rtree-and-val (number-leaves-helper rtree new-val))
               (new-rtree (car rtree-and-val))
               (new-rval (cdr rtree-and-val)))
          (cons (interior-node (car x) new-ltree new-rtree)
                new-rval)))))

(define number-leaves
  (lambda (x)
    (car (number-leaves-helper x 0))))

(define test (interior-node 'red
                            (interior-node 'bar
                                           (leaf 26)
                                           (leaf 12))
                            (interior-node 'red
                                           (leaf 11)
                                           (interior-node 'quux
                                                          (leaf 117)
                                                          (leaf 14)))))
