#lang sicp
; Exercise 1.3.  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (square x)
  (* x x))

(define (max x y)
  (if (> x y) x
      y))

(define (min x y)
  (if (< x y) x
      y))

(define (max_three x y z)
  (max (max x y)
       (max y z)))

(define (mid x y z)
  (cond ((= (max_three x y z) x) (max y z))
        ((= (max_three x y z) y) (max x z))
        ((= (max_three x y z) z) (max x y))))

#;(define (sum_of_larger_squares x y z)
  (+
   (square (max_three x y z))
   (square (mid x y z))))

(define (sum_of_larger_squares x y z)
  (+
   (square (max x y))
   (square (max (min x y) z))))

(sum_of_larger_squares 3 4 5)