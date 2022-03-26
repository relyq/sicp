#lang sicp
;Exercise 1.10.  The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10)

(A 2 4)

(A 3 3)

; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

;Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.


(A 1 10)
#|
(cond ((= 10 0) 0)
      ((= 1 0) (* 2 10))
      ((= 10 1) 2)
      (else (A (- 1 1)
               (A 1 (- 10 1)))))

(A 1 (- 10 1)) > (A 1 (- 2 1)) > (2)

(else (A (- 1 1)
      (2))

(A (- 1 1) 2) > 4

(else (A (- 1 1)
      (4))

(A (- 1 1) 4) > 8

...
|#

; (A 1 10) ; 2^10 = 1024

(A 2 4)
#|
(cond ((= 4 0) 0)
      ((= 2 0) (* 2 4))
      ((= 4 1) 2)
      (else (A (- 2 1)
               (A 2 (- 4 1)))))

(A 2 4) -> 2^16
  (A 1 (A 2 3))
    (A 1 (A 2 2))
      (A 1 (A 2 1))
      (A 1    2   ) -> 4
        (A 0 (A 1 1)) -> 4
        (A 0    2   ) -> 4
    (A 1    4   ) -> 16
      (A 0 (A 1 3)) -> 16
        (A 0 (A 1 2)) -> 8
          (A 0 (A 1 1)) -> 4
  (A 1 16) -> 2^16
    (A 0 (A 1 15)) -> 2^16
      (A 0 (A 1 14)) -> 2^15
        ...
          (A 0 (A 1 1)) -> 2^2

|#

#|
(A 3 3)
  (A 2 (A 3 2))
    (A 2 (A 3 1))
    (A 2    2   ) -> 4
  (A 2 4) -> 2^16
(A 3 3) -> 2^16
|#


