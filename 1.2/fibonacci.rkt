#lang sicp
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 12)

#|
tree recursion
                  (+ (fib (- 12 1))
                     (fib (- 12 2)))
           (+ (fib (- 11 1)) (+ (fib (- 10 1))
              (fib (- 11 2)))   (fib (- 10 2)))
    (+ (fib (- 10 1)) (+ (fib (- 9 1)) (+ fib 
       (fib (- 10 2)))   (fib (- 9 2))
|#