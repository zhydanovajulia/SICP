#lang racket
(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (my-product-iter sum b a)
  (cond ((= a 0) sum)
        ((even? a) (my-product-iter sum (double b) (halve a)))
        (else (my-product-iter (+ sum b) b (- a 1)))))

(define (product x y)
  (cond ((> x y) (my-product-iter 0 x y))
        (else (my-product-iter 0 y x))))

(product 85 4)