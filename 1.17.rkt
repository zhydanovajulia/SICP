#lang racket

(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (my-product b a)
  (cond ((= a 0) 0)
        ((even? a) (double (my-product b (halve a))))
        (else (+ b (my-product b (- a 1))))))

(my-product 4 4)
