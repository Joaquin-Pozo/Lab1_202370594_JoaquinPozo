#lang scheme
(provide get-subway-name get-subway-trains get-subway-lines get-subway-drivers)
(define get-subway-name (lambda (sub) (first sub)))
(define get-subway-trains (lambda (sub) (second sub)))
(define get-subway-lines (lambda (sub) (third sub)))
(define get-subway-drivers (lambda (sub) (last sub)))