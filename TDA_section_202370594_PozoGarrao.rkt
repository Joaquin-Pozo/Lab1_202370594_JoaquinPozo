#lang scheme
(require "TDA_station.rkt")
(provide get-section-distance get-section-cost get-station1 get-station2 station-name-duplicated? station-id-duplicated?)

;; TDA: SELECTOR - Funcion adicional que permite obtener la distancia de una sección
;; DOM: line (line)
;; REC: sections (sections)
(define get-section-distance (lambda (section) (third section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la primera estación de una sección
;; DOM: line (line)
;; REC: sections (sections)
(define get-station1 (lambda (section) (first section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la segunda estación de una sección
;; DOM: line (line)
;; REC: sections (sections)
(define get-station2 (lambda (section) (second section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el costo de una seccion
;; DOM: seccion (section)
;; REC: costo (int)
(define get-section-cost
  (lambda (section) (last section)))
;; TDA: VERIFICADOR - Funcion adicional que verifica si una sección tiene al menos un nombre de estación duplicado
;; DOM: section1 X section 2 (section)
;; REC: #t | #f (boolean)
(define station-name-duplicated?
  (lambda (section1 section2)
    (if (or
         (equal? (get-station-name (get-station1 section1)) (get-station-name (get-station1 section2)))
         (equal? (get-station-name (get-station2 section1)) (get-station-name (get-station2 section2))))
        #t
        #f)))
;; TDA: VERIFICADOR - Funcion adicional que verifica si una sección tiene al menos un id de estación duplicado
;; DOM: section1 X section 2 (section)
;; REC: #t | #f (boolean)
(define station-id-duplicated?
  (lambda (section1 section2)
    (if (or
         (= (get-station-id (get-station1 section1)) (get-station-id (get-station1 section2)))
         (= (get-station-id (get-station2 section1)) (get-station-id (get-station2 section2))))
        #t
        #f)))

