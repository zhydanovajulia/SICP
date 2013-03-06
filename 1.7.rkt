#lang racket
(define (square x)
  (* x x))
(define (good-enough guess prev-guess x)
  (display (/ (abs (- guess prev-guess )) guess))
  ;Видно, что при такой погрешности результаты становятся более точными для мелких чисел. На большие числа это не влияет.
  (< (/ (abs (- guess prev-guess )) guess) 0.001))

(define (good-enough? guess prev x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough guess prev-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (cond ((or (= x 0) (= x 1)) x)
        (else (sqrt-iter 1.0 0 x))))

(sqrt 1.0) 
;(sqrt 0.0000001)
;(sqrt 100000000000)

;;good-enough? 
;sqrt(0.0000001) = 0.03125106561775382
;square(0.03125106561775382) = 0.000976629102245155

;sqrt(100000000000) = 316227.7660168379
;square(316227.7660168379) = 100000000001.20638

;-------------------------------------------
;;good-enough 
;sqrt(0.0000001) = 0.00031622776664863746
;square(0.00031622776664863746) = 1.000000003995851e-07

;sqrt(100000000000) = 316227.7660168379
;square(316227.7660168379) = 100000000001.20638


