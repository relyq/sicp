#lang sicp
; Exercise 1.7.  The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y)
   2))

(define (improve guess x)
  (average guess
           (/ x guess)))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; very small numbers plainly don't work due to good-enough? comparison precision
; very large numbers don't work because of limited system precision. the procedure gets stuck as (improve guess x) keeps returning the same value but (good-enough? guess x) keeps returning #f.

; new (good-enough?) procedure checks if the guess can be improved

(sqrt 0.000000001)
(sqrt 10000000000000)