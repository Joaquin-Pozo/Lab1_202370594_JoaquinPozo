#lang scheme
(provide get-station-name get-station-id)

;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre de una estacion
;; DOM: station (station)
;; REC: nombre-estacion (string)
(define get-station-name (lambda (station) (second station)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el id de una estacion
;; DOM: station (station)
;; REC: id (int)
(define get-station-id (lambda (station) (first station)))


