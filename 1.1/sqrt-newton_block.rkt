#lang sicp

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y)
   2))

(define (sqrt x)
  (define (improve guess)
    (average guess
             (/ x guess)))
  
  (define (good-enough? guess)
    (= (improve guess) guess))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  
  (sqrt-iter 1.0))

(sqrt 2)