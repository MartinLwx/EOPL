#lang eopl

; Let's say base = 16
(define BASE 16)

(define zero '())

(define is-zero?
  (lambda (xs)
    (null? xs)))

(define successor-helper
  (lambda (xs curry)
    (if (not curry)
        xs
        (if (null? xs)
            '(1)
            (let ((temp (+ 1 (car xs))))
              (if (>= temp BASE)
                  (cons (- temp BASE) (successor-helper (cdr xs) #t))
                  (cons temp (cdr xs))))))))
        
(define successor
  (lambda (xs)
    (successor-helper xs #t)))

(define predecessor-helper
  (lambda (xs curry)
    (if (not curry)
        xs
        (let ((temp (- (car xs) 1)))
          (cond ((< temp 0) (cons (+ temp BASE) (predecessor-helper (cdr xs) #t)))
                ((= temp 0) (if (null? (cdr xs)) '() (cons 0 (cdr xs))))
                (else (cons temp (cdr xs))))))))
                
(define predecessor
  (lambda (xs)
    (predecessor-helper xs #t)))

(define plus
  (lambda (x y)
    (if (is-zero? x)
        y
        (successor (plus (predecessor x) y)))))

(define multiply
  (lambda (x y)
     (if (is-zero? (predecessor x))
         y
         (plus y (multiply (predecessor x) y)))))

(define factorial
  (lambda (x)
    (if (is-zero? x)
        (successor zero)
        (multiply x (factorial (predecessor x))))))
