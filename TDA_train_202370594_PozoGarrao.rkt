#lang scheme
(provide get-pcars get-train-id get-train-maker get-train-rail-type get-train-speed get-train-station-stay-time add-car remove-car)

;; TDA: SELECTOR - Funcion adicional que permite obtener los carros de un tren
;; DOM: train (train)
;; REC: lista de los carros (list pcars)
(define get-pcars (lambda (train) (last train)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el id del tren
;; DOM: train (train)
;; REC: id (int)
(define get-train-id (lambda (train) (first train)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el fabricante del tren
;; DOM: train (train)
;; REC: maker (string)
(define get-train-maker (lambda (train) (second train)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tipo de carril del tren
;; DOM: train (train)
;; REC: rail-type (string)
(define get-train-rail-type (lambda (train) (third train)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la velocidad del tren
;; DOM: train (train)
;; REC: speed (int)
(define get-train-speed (lambda (train) (fourth train)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tiempo de parada del tren
;; DOM: train (train)
;; REC: station-stay-time (int)
(define get-train-station-stay-time (lambda (train) (fifth train)))
;; TDA: Modificador - Funcion adicional que permite agregar un carro en una posicion dada (indice)
;; DOM: lista de carros (list pcars) X carro a agregar (pcar) X posicion (int)
;; REC: lista de carros actualizada (list pcars)
(define (add-car pcars pcar position)
  (define (fn-interna pcars pcar position i acc)
    (cond
      [(null? pcars) (if (= i position) (append acc (list pcar)) acc)]
      [(= i position) (fn-interna (cdr pcars) pcar position (+ i 1) (append acc (list pcar) (list (car pcars))))]
      [else (fn-interna (cdr pcars) pcar position (+ i 1) (append acc (list (car pcars))))]))
  (fn-interna pcars pcar position 0 null))
;; TDA: Modificador - Funcion adicional que permite eliminar un carro en una posicion dada (indice)
;; DOM: lista de carros (list pcars) X carro a agregar (pcar) X posicion (int)
;; REC: lista de carros actualizada (list pcars)
(define (remove-car pcars position)
  (define (fn-interna pcars position i acc)
    (cond
      [(null? pcars) acc]
      [(= i position) (fn-interna (cdr pcars) position (+ i 1) acc)]
      [else (fn-interna (cdr pcars) position (+ i 1) (append acc (list (car pcars))))]))
  (fn-interna pcars position 0 null))