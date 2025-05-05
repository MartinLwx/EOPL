#lang eopl

; Evaluation
(define eval
  (lambda (maybe-tree)
    (if (eqv? (car maybe-tree) 'one)
        1
        (let ((lhs (eval (cadr maybe-tree)))
              (rhs (eval (caddr maybe-tree))))
          (- lhs rhs)))))

(define zero '(diff (one) (one)))

(define minus-one '(diff (diff (one) (one)) (one)))

(define is-zero?
  (lambda (x)
    (= 0 (eval x))))

(define successor
  (lambda (maybe-tree)
    (if (eqv? (car maybe-tree) 'one)
        (list 'diff '(one) minus-one)
        (list 'diff maybe-tree minus-one))))

(define predecessor
  (lambda (maybe-tree)
    (if (eqv? (car maybe-tree) 'one)
        zero
        (list 'diff maybe-tree '(one)))))

; get -x from x
(define flip
  (lambda (maybe-tree)
    (if (eqv? (car maybe-tree) 'one)
        minus-one
        (list 'diff (caddr maybe-tree) (cadr maybe-tree)))))

; x + y = x - (-y)
(define diff-tree-plus
  (lambda (x y)
    (list 'diff x (flip y))))
