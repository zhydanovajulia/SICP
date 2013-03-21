#lang racket
(define (cube x) (* x x x))

(define (p x) 
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)

; a) Функция  p выполнится 5 раз
; b) Порядок роста в терминах кол-ва шагов - log(x), то же самое по памяти, так как процесс рекурсивный.