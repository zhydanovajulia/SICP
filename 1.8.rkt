#lang racket
(define (square x) (* x x))

(define (third x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (good-enough? guess prev x)
  (< (abs (- guess prev )) 0.001))

(define (improve guess x)
  (third x guess))

(define (cube-root guess prev x)
  (if (good-enough? guess prev x)
      guess
      (cube-root (improve guess x) guess x)))

(cube-root 1.0 0 64)