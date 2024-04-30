#lang scheme
(require "TDA_line.rkt" "TDA_section.rkt")
(provide get-subway-id-and-name get-subway-trains get-subway-lines get-subway-drivers subway-lines-interna)

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
(define get-subway-drivers (lambda (sub) (last sub)))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las lineas de un subway
;; DOM: lista lines (line)
;; REC: line (line)
(define subway-lines-interna
  (lambda (subway-lines fn)
    (map (lambda (line) (line-interna line fn)) subway-lines)))
;; TDA: SELECTOR - Funcion adicional que permite recorrer las secciones de una linea
;; DOM: line (line)
;; REC: line-sections (section)
(define line-interna
  (lambda (line fn)
    (list
     (get-line-id line)
     (get-line-name line)
     (get-line-rail-type line)
     (map (lambda (section) (modify-section-cost section fn)) (get-line-sections line)))))
;; TDA: MODIFICADOR - Funcion adicional que permite cambiar el costo de una seccion
;; DOM: seccion (section)
;; REC: seccion (section)
(define modify-section-cost
  (lambda (section fn)
    (list (get-station1 section)
          (get-station2 section)
          (get-section-distance section)
          (fn (get-section-cost section)))))