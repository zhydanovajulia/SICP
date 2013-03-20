#lang racket

;a1 = b0*q + a0*q + a0*p
;b1 = b0*p + a0*q

;a2 = b1*q + a1*q + a1*p
;b2 = b1*p + a1*q

;a2 = b0*q` + a0*q` + a0*p`
;b2 = b0*p` + a0*q`

; b1*q + a1*q + a1*p = b0*q` + a0*q` + a0*p`
; b1*p + a1*q = b0*p` + a0*q`

; Итого: 
; q` = 2pq + q^2
; p` = p^2 + q^2


(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count) 
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; вычислить p’
                   (+ (* 2 p q) (* q q)); вычислить q’ 
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))

(fib 7)
