#lang scheme
(require "TDA_line.rkt" "TDA_section.rkt" "TDA_station.rkt")
(provide get-subway-id-and-name get-subway-trains get-subway-lines get-subway-drivers get-subway-routes subway-lines-interna subway-lines-interna-2 assign-train-id-to-line)

;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre y id de un subway
;; DOM: sub (subway)
;; REC: lista de id y name (list)
(define get-subway-id-and-name (lambda (sub) (first sub)))
;; TDA: SELECTOR - Funcion adicional que permite obtener los trenes de un subway
;; DOM: sub (subway)
;; REC: lista trains (train)
(define get-subway-trains (lambda (sub) (second sub)))
;; TDA: SELECTOR - Funcion adicional que permite obtener las lineas de un subway
;; DOM: sub (subway)
;; REC: lista lines (line)
(define get-subway-lines (lambda (sub) (third sub)))
;; TDA: SELECTOR - Funcion adicional que permite obtener los divers de un subway
;; DOM: sub (subway)
;; REC: lista drivers (driver)
(define get-subway-drivers (lambda (sub) (fourth sub)))
;; TDA: SELECTOR - Funcion adicional que permite obtener los recorridos de un subway
;; DOM: sub (subway)
;; REC: lista routes (routes)
(define get-subway-routes (lambda (sub) (last sub)))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las lineas de un subway
;; DOM: lista lines (line) X fn (function)
;; REC: line (line)
(define subway-lines-interna
  (lambda (subway-lines fn)
    (map (lambda (line) (line-interna line fn)) subway-lines)))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las secciones de una linea
;; DOM: line (line) X fn (function)
;; REC: line-sections (section)
(define line-interna
  (lambda (line fn)
    (list
     (get-line-id line)
     (get-line-name line)
     (get-line-rail-type line)
     (map (lambda (section) (modify-section-cost section fn)) (get-line-sections line)))))
;; TDA: MODIFICADOR - Funcion adicional que permite cambiar el costo de una seccion
;; DOM: seccion (section) X fn (function)
;; REC: seccion (section)
(define modify-section-cost
  (lambda (section fn)
    (list (get-station1 section)
          (get-station2 section)
          (get-section-distance section)
          (fn (get-section-cost section)))))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las lineas de un subway
;; DOM: lista lines (line) X station-name (string) X new-time (integer)
;; REC: line (line)
(define subway-lines-interna-2
  (lambda (subway-lines station-name new-time)
    (map (lambda (line) (line-interna-2 line station-name new-time)) subway-lines)))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las secciones de una linea
;; DOM: line (line) X station-name (string) X new-time (integer)
;; REC: line-sections (section)
(define line-interna-2
  (lambda (line station-name new-time)
    (list
     (get-line-id line)
     (get-line-name line)
     (get-line-rail-type line)
     (map (lambda (section) (modify-station-stop-time section station-name new-time)) (get-line-sections line)))))
;; TDA: MODIFICADOR - Funcion adicional que permite cambiar el tiempo de parada de una estacion
;; DOM: seccion (section) X station-name (string) X new-time (integer)
;; REC: seccion (section)
(define modify-station-stop-time
  (lambda (section station-name new-time)
    (list (modifiy-station-stop-time-interna (get-station1 section) station-name new-time)
          (modifiy-station-stop-time-interna (get-station2 section) station-name new-time)
          (get-section-distance section)
          (get-section-cost section))))
;; TDA: MODIFICADOR - Funcion adicional que permite cambiar el tiempo de parada de una estacion
;; DOM: seccion (section) X station-name (string) X new-time (integer)
;; REC: station (station)
(define modifiy-station-stop-time-interna
  (lambda (station station-name new-time)
    (if (equal? (get-station-name station) station-name)
        (list (get-station-id station)
              (get-station-name station)
              (get-station-type station)
              new-time)
        (list (get-station-id station)
              (get-station-name station)
              (get-station-type station)
              (get-station-stop-time station)))))
;; TDA: MODIFICADOR - Funcion adicional que permite cambiar el tiempo de parada de una estacion
;; DOM: seccion (section) X station-name (string) X new-time (integer)
;; REC: station (station)
(define assign-train-id-to-line
  (lambda (line train-id line-id)
        (if (= line-id (get-line-id line))
            (list
             (get-line-id line)
             (get-line-name line)
             (get-line-rail-type line)
             (append (get-line-sections line) (list train-id)))
            line)))









