#lang scheme
(provide get-pcar-models get-pcar-types same-models? correct-order?)

;; TDA: SELECTOR - Funcion adicional que permite obtener el/los modelo/s de un/unos pcar/s
;; DOM: pcar (pcar)
;; REC: lista de los modelos de pcars (list)
(define get-pcar-models (lambda (pcar) (map (lambda (x) (third x)) pcar)))

;; TDA: SELECTOR - Funcion adicional que permite obtener el/los tipo/s de un/unos pcar/s
;; DOM: pcar (pcar)
;; REC: lista de los modelos de pcars (list)
(define get-pcar-types (lambda (pcar) (map (lambda (x) (last x)) pcar)))

;; TDA: VERIFICADOR - Funcion adicional que permite validar si los modelos de pcars son compatibles
;; DOM: pcar (pcar)
;; REC: #t | #f (boolean)
(define (same-models? pcar-models)
  (cond
    [(null? pcar-models) #t]
    [(null? (cdr pcar-models)) #t]
    [(equal? (first pcar-models) (second pcar-models)) (same-models? (cdr pcar-models))]
    [else #f]))


;; TDA: VERIFICADOR - Funcion adicional que permite validar si existe coherencia de orden en los carros
;; DOM: pcar-types (list)
;; REC: #t | #f (boolean)
(define all-central?
  (lambda (pcar-types)
    (cond
      [(or (null? pcar-types) (null? (cdr pcar-types))) #t]
      [(equal? (first pcar-types) (second pcar-types)) (all-central? (cdr pcar-types))]
      [else #f])))

;; TDA: VERIFICADOR - Funcion adicional que permite validar si existe coherencia de orden en los carros
;; DOM: pcar-types (list)
;; REC: #t | #f (boolean)
(define correct-order?
  (lambda (pcar-types)
    (cond
      [(and (equal? (first pcar-types) "terminal")
            (equal? (last pcar-types) "terminal")
            (all-central? (reverse (cdr (reverse (cdr pcar-types)))))) #t]
      [else #f])))

