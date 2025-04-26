#lang eopl

(define nth-element-helper
  (lambda (lst n)
    (if (zero? n)
        (car lst)
        (nth-element (cdr lst) (- n 1)))))

(define nth-element
  (lambda (lst n)
    (if (<= (length lst) n)
        (report-list-too-short lst n)
        (nth-element-helper lst n))))

(define report-list-too-short
  (lambda (lst n)
    (eopl:error 'nth-element
                "~s does not have ~s elements (index start from 0).~%" lst n)))
