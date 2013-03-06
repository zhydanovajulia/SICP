#lang racket
(define (square x) (* x x))
(define (cube x)(* x x x))

(define (third x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (good-enough? guess prev x)
  (< (/ (abs (- guess prev)) guess) 0.001))

(define (improve guess x)
  (third x guess))

(define (cube-iter guess prev x)
  (if (good-enough? guess prev x)
      guess
      (cube-iter (improve guess x) guess x)))
(define (cube-root x)
  (cube-iter 1.0 0 x))

(cube-root 64) ; 4.000000000076121 ; 64.00083758016928
(cube-root 0.000000000009) ; 0.00020800843914385545 ;0.0006766394902792291
(cube-root 100000000000000) ;46415.88833612779 ;1e+14
(* 4.000000000076121 4.000000000076121 4.000000000076121)
(* 0.00020800843914385545 0.00020800843914385545 0.00020800843914385545)

(cube-root 0)