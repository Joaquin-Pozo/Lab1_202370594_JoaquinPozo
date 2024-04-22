#lang scheme
(provide get-station1-name get-station2-name section-contains-stations?)

;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre de una estacion
;; DOM: seccion (section)
;; REC: nombre-seccion (string)
(define get-station1-name (lambda (section) (second (first section))))
;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre de una estacion
;; DOM: seccion (section)
;; REC: nombre-seccion (string)
(define get-station2-name (lambda (section) (second (second section))))
;; TDA: VALIDADOR - Funcion adicional que permite verificar si existen dos estaciones dentro de una sección
;; DOM: nombre-estación1 (string) X nombre-estación2 (string)
;; REC: #t | #f
(define section-contains-stations?
  (lambda (station1-name station2-name)
    (lambda (section)
      (and
        (eq? (get-station1-name section) station1-name)
        (eq? (get-station2-name section) station2-name)))))