#lang racket

(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (my-product sum b a)
  (cond ((= a 0) sum)
        ((even? a) (my-product sum (double b) (halve a)))
        (else (my-product (+ sum b) b (- a 1)))))

(my-product 0 5 5)