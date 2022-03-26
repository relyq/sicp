#lang sicp

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y)
   2))

(define (improve guess x)
  (average guess
           (/ x guess)))

(define (good-enough? guess x)
  (<
   (abs (-
         (square guess)
         x))
   0.001))

; Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)

; new-if is subject to applicative-order evaluation, so it makes the procedure not short-circuit and it evaluates both clauses. the iterative procedure will be called recursively without returning until it causes an out of memory error.