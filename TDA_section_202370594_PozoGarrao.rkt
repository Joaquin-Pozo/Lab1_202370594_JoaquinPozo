#lang scheme
(require "TDA_station_202370594_PozoGarrao.rkt")
(provide get-section-distance get-section-cost get-station1 get-station2)

;; TDA: SELECTOR - Funcion adicional que permite obtener la distancia de una sección
;; DOM: section (section)
;; REC: secion distance (int)
(define get-section-distance (lambda (section) (third section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la primera estación de una sección
;; DOM: section (section)
;; REC: station (station)
(define get-station1 (lambda (section) (first section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la segunda estación de una sección
;; DOM: section (section)
;; REC: station (station)
(define get-station2 (lambda (section) (second section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el costo de una seccion
;; DOM: section (section)
;; REC: costo (int)
(define get-section-cost (lambda (section) (last section)))