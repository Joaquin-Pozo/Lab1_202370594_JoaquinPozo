#lang scheme
(provide get-station-name get-station-id get-station-type get-station-stop-time)

;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre de una estacion
;; DOM: station (station)
;; REC: nombre-estacion (string)
(define get-station-name (lambda (station) (second station)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el id de una estacion
;; DOM: station (station)
;; REC: id (int)
(define get-station-id (lambda (station) (first station)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tipo de estacion
;; DOM: station (station)
;; REC: station-type (station-type)
(define get-station-type (lambda (station) (third station)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tiempo de parada de una estacion
;; DOM: station (station)
;; REC: stop-time (int)
(define get-station-stop-time (lambda (station) (last station)))



