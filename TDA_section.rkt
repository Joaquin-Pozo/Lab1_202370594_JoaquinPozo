#lang scheme
(provide get-section-distance get-section-cost)

;; TDA: SELECTOR - Funcion adicional que permite obtener la distancia de una sección
;; DOM: line (line)
;; REC: sections (sections)
(define get-section-distance (lambda (section) (third section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el costo de una seccion
;; DOM: seccion (section)
;; REC: costo (int)
(define get-section-cost
  (lambda (section) (last section)))