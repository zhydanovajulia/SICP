#lang scheme
(define (>= x y) (or (> x y)(= x y))) 

(define (ab a b c) (and (>= a c)(>= b c))) 
(define (ac a b c) (and (>= a b)(>= c b)))

(define (square x) (* x x))

(define (sum_squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares a b c) 
  (cond ((ab a b c)(sum_squares a b))
        ((ac a b c)(sum_squares a c))
        (else (sum_squares b c)))) 

(sum-of-squares 5 7 3)



