#lang racket

(define (my-exp a b n)
  (cond ((= n 0) a)
        ((even? n) (my-exp a (square b) (/ n 2)))
        (else (my-exp (* a b) b (- n 1)))
  ))
  


(my-exp 1 3 10)  