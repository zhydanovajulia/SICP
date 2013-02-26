#lang racket
(define (square x)
  (* x x))
(define (good-enough guess prev-guess x)
  (display "[")
  (display guess)
  (display " ")
  (display prev-guess)
  (display " ")
  (display (abs (- guess prev-guess )))
  (display "]")
  ; Не похоже, что в таком виде процедура работает лучше. Возможно точнее, т.к. на очень мелких числах результат сильно отличается в десятых и сотых.
  (< (abs (- guess prev-guess )) 0.001))

(define (good-enough? guess prev x)
  (display "[")
  (display guess)
  (display " ")
  (display (abs (- (square guess) x)))
  (display "]")
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt 0.1)
;;good-enough? 
; sqrt 0.0000001
;0.03125106561775382
; sqrt 100000000000
; 316227.7660168379

;;good-enough 
; sqrt 0.0000001
;0.0010104595507340792
; sqrt 100000000000
; 316227.7660168379
