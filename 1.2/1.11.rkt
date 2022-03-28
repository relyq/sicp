#lang sicp
; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; recursive

(define (f n)
  (if (< n 3)
      n
      (+ (* 1 (f (- n 1)))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


(f 4)

#|
>(f 4)               ; (+ 4 2 1) ; 11
(+ (* 1 (f (- 4 1))) ; (* 1 4)   ; 4
   (* 2 (f (- 4 2))) ; (* 2 2)   ; 4
   (* 3 (f (- 4 3))) ; (* 3 1)   ; 3

>(f (- 4 1))         ; (+ 2 2 0) ; 4
(+ (* 1 (f (- 3 1))) ; (* 1 2)   ; 2
   (* 2 (f (- 3 2))) ; (* 2 1)   ; 2
   (* 3 (f (- 3 3))) ; (* 3 0)   ; 0

>(f (- 3 1))
2

>(f (- 3 2))
1

>(f (- 3 3))
0

>(f (- 4 2))
2

>(f (- 4 3))
1
|#

; iterative
; https://stackoverflow.com/a/4995839/18291035

(define (fn n)
  (if (< n 3)
      n
      (f-iter 2 1 0 3 n)))

(define (f-iter x y z i n)
  (if (= i n)
      (+ x (* 2 y) (* 3 z))
      (f-iter (+ x (* 2 y) (* 3 z)) x y (+ i 1) n)))

(fn 4)

#|
(fn 4)

>(f-iter 2 1 0 3 4)

>(f-iter (+ 2 (* 2 1) (* 3 0)) 2 1 (+ 3 1) 4)

>(if (= 4 4) (+ 4 (* 2 2) (* 3 1)))
11
|#