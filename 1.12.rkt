#lang racket

;C[k+1][n+1] = C[k+1][n] + C[k][n], k+1 - коэффициент в n-й строке

(define (C n k)
  (cond ((> k n) (display "Error, count of numbers can't be more than raw number."))
        ((= k 0) 1)
        ((= n k) 1)
        (else (+ (C (- n 1) (- k 1)) (C (- n 1) k)))))

(C 1 5)
