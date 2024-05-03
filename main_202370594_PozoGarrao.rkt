#lang scheme
;; Universidad de Santiago de Chile
;; Paradigmas de Programación - Laboratorio N°1: Scheme
;; Estudiante: Joaquín Pozo Garrao
;; RUT: 20.237.059-4

(require "TDA_station_202370594_PozoGarrao.rkt" "TDA_line_202370594_PozoGarrao.rkt" "TDA_section_202370594_PozoGarrao.rkt"
         "TDA_pcar_202370594_PozoGarrao.rkt" "TDA_train_202370594_PozoGarrao.rkt" "TDA_subway_202370594_PozoGarrao.rkt" "TDA_driver_202370594_PozoGarrao.rkt")

(provide station section line line-length line-section-length line-cost line-section-cost line-add-section line? pcar train train-add-car train-remove-car
         train? train-capacity driver subway subway-add-train subway-add-line subway-add-driver subway->string subway-rise-section-cost subway-set-station-stoptime
         subway-assign-train-to-line t c r m tr ct subway-assign-driver-to-train)

;: Req 2. TDA station - constructor: Funcion constructora de estaciones de metro.
;: DOM: id (int) X nombre (str) X tipo (str) X tiempo-parada (int)
;: REC: station (list)
(define t 0) ; estacion terminal
(define c 1) ; estacion de combinacion
(define r 2) ; estacion regular
(define m 3) ; estacion de mantencion

(define station
  (lambda (id name type stop-time)
    (list id name type stop-time)))
;: Req 3. TDA section - constructor: Funcion constructora de enlaces entre dos estaciones de metro.
;: DOM: point1 (station) X point2 (station) X distance (positive-number) X cost (positive-number U {0}). 
;: REC: section (list)
(define section
  (lambda (point1 point2 distance cost)
    (list point1 point2 distance cost)))
;: Req 4. TDA line - constructor: Función que permite crear una línea de metro.
;: DOM: id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;: REC: line (list)
(define line
  (lambda (id name rail-type . sections)
    (list id name rail-type sections)))
;; Req 5. TDA line - otras funciones: Funcion que permite determinar el largo total de una línea (en la unidad de medida expresada en cada tramo).
;; DOM: line (line)
;; REC: positive-number (int)
(define line-length (lambda (line) (apply + (map (lambda (section) (get-section-distance section)) (get-line-sections line)))))
;; Req 6. TDA line - otras funciones: Función que permite determinar el trayecto entre una estación origen y una final.
;; Pueden usar recursividad.
;; DOM: line (line) X station1-name (String) X station2-name (String)
;; REC: positive-number (int)
(define line-section-length
  (lambda (line station1-name station2-name)
    (define fn-interna
      (lambda (line-sections station1-name station2-name acc indicador)
        (cond
          [(null? line-sections) acc]
          [(and (equal? (get-station-name (get-station1 (get-first-line-section line-sections))) station1-name)
                (equal? (get-station-name (get-station2 (get-first-line-section line-sections))) station2-name))
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-distance (get-first-line-section line-sections))) indicador)]
          [(equal? (get-station-name (get-station1 (get-first-line-section line-sections))) station1-name)
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-distance (get-first-line-section line-sections))) (+ indicador 1))]
          [(and (equal? (get-station-name (get-station2 (get-first-line-section line-sections))) station2-name) (eq? indicador 1))
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-distance (get-first-line-section line-sections))) (- indicador 1))]
          [(eq? indicador 1)
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-distance (get-first-line-section line-sections))) indicador)]
          [else
           (fn-interna (cdr line-sections) station1-name station2-name acc indicador)])))
    (fn-interna (get-line-sections line) station1-name station2-name 0 0)))
;; Req 7. TDA line - otras funciones: Función que permite determinar el costo total (monetario) de recorrer una línea. Resolver con recursividad natural.
;; DOM: line (line)
;; REC: positive-number U {0}
(define line-cost
  (lambda (line)
    (define fn-interna
      (lambda (line-sections)
        (if (null? line-sections)
            0
            (+ (get-section-cost (get-first-line-section line-sections)) (fn-interna (cdr line-sections))))))
    (fn-interna (get-line-sections line))))
;; Req 8. TDA line - otras funciones: Función que permite determinar el costo de un trayecto entre una estación origen y una final. Resolver con recursividad de cola.
;; DOM: line (line) X station1-name (String) X station2-name (String). Resolver con recursividad de cola.
;; REC: positive-number U {0}
(define line-section-cost
  (lambda (line station1-name station2-name)
    (define fn-interna
      (lambda (line-sections station1-name station2-name acc indicador)
        (cond
          [(null? line-sections) acc]
          [(and (equal? (get-station-name (get-station1 (get-first-line-section line-sections))) station1-name)
                (equal? (get-station-name (get-station2 (get-first-line-section line-sections))) station2-name))
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-cost (get-first-line-section line-sections))) indicador)]
          [(equal? (get-station-name (get-station1 (get-first-line-section line-sections))) station1-name)
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-cost (get-first-line-section line-sections))) (+ indicador 1))]
          [(and (equal? (get-station-name (get-station2 (get-first-line-section line-sections))) station2-name) (eq? indicador 1))
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-cost (get-first-line-section line-sections))) (- indicador 1))]
          [(eq? indicador 1)
           (fn-interna (cdr line-sections) station1-name station2-name (+ acc (get-section-cost (get-first-line-section line-sections))) indicador)]
          [else
           (fn-interna (cdr line-sections) station1-name station2-name acc indicador)])))
    (fn-interna (get-line-sections line) station1-name station2-name 0 0)))
;; Req 9. TDA line - modificador: Función que permite añadir tramos a una línea. Resolver con recursividad natural.
;; Verifica al momento de incorporar un tramo si éste está duplicado.
;; DOM: line (line) X section (section)
;; REC: line (line)
(define line-add-section
  (lambda (line section)
    (list
     (get-line-id line)
     (get-line-name line)
     (get-line-rail-type line)
     (fn-add-section (get-line-sections line) section))))
;; Req 10. TDA Línea - pertenencia: Función que permite determinar si un elemento cumple con las restricciones señaladas en apartados anteriores en
;; relación a las estaciones y tramos para poder conformar una línea. Ocupar un acumulador. Emplear algún tipo de recursividad.
;; DOM: line (line)
;; REC: #t | #f (boolean)
(define line?
  (lambda (line)
    (if (duplicated-sections? (get-line-sections line))
        #t
        #f)))
;; Req 11. TDA pcar - Constructor: Función que permite crear los carros de pasajeros que conforman un convoy. Los carros pueden ser de
;; tipo terminal (tr) o central (ct).
;; DOM: id (int) X capacity (positive integer) X model (string) X type (car-type)
;; REC: pcar
(define tr "terminal")
(define ct "central")

(define pcar
  (lambda (id capacity model type)
    (list id capacity model type)))
;; Req 12. TDA train - Constructor: Función que permite crear un tren o convoy.
;; DOM: id (int) X maker (string) X rail-type (string) X speed (positive number) X station-stay-time (positive number U {0}) X pcar*
;; REC: train
(define train
  (lambda (id maker rail-type speed station-stay-time . pcar)
    (cond
      [(null? pcar) (list id maker rail-type speed station-stay-time pcar)]
      [(and (same-models? (get-pcar-models pcar)) (correct-order? (get-pcar-types pcar)))
       (list id maker rail-type speed station-stay-time pcar)]
      [else (list id maker rail-type speed station-stay-time null)])))
;; Req 13. TDA train - Modificador: Función que permite añadir carros a un tren en una posición dada.
;; Emplear algún tipo de recursividad. 
;; DOM: train (train) X pcar (pcar) X position (positive-integer U {0})
;; REC: train
(define train-add-car
  (lambda (train pcar position)
    (list
     (get-train-id train)
     (get-train-maker train)
     (get-train-rail-type train)
     (get-train-speed train)
     (get-train-station-stay-time train)
     (add-car (get-pcars train) pcar position))))
;; Req 14. TDA train - Modificador: Función que permite eliminar un carro desde el convoy.
;; Emplear algún tipo de recursividad.
;; DOM: train (train) X position (positive-integer U {0})
;; REC: train
(define train-remove-car
  (lambda (train position)
    (list
     (get-train-id train)
     (get-train-maker train)
     (get-train-rail-type train)
     (get-train-speed train)
     (get-train-station-stay-time train)
     (remove-car (get-pcars train) position))))
;; Req 15. TDA train - Pertenencia: Función que permite determinar si un elemento es un tren válido, esto es,
;; si el elemento tiene la estructura de tren y los carros que lo conforman son compatibles (mismo modelo)
;; y tienen una disposición coherente con carros terminales (tr) en los extremos y centrales (ct) en medio del convoy.
;; Emplear algún tipo de recursividad.
;; DOM: train
;; REC: boolean
(define train?
  (lambda (train)
    (if (null? (get-pcars train))
        #f
        (if (null? (cdr (get-pcars train)))
            #f
            (if (and (eq? (length train) 6)
                     (same-models? (get-pcar-models (get-pcars train)))
                     (correct-order? (get-pcar-types (get-pcars train))))
                #t
                #f)))))
;; Req 16. TDA train - Otras funciones: Función que permite determinar la capacidad máxima de pasajeros del tren. Emplear algún tipo de recursividad.
;; DOM: train
;; REC: positive-number U {0}
(define train-capacity
  (lambda (train)
    (define fn-interna
      (lambda (train-pcars)
        (cond
          [(null? train-pcars) 0]
          [(+ (get-pcar-capacity (car train-pcars)) (fn-interna (cdr train-pcars)))])))
    (fn-interna (get-pcars train))))
;; Req 17. TDA driver - Constructor: Función que permite crear un conductor cuya habilitación de conducción depende del fabricante de tren (train-maker).
;; DOM: id (int) X nombre (string) X train-maker (string)
;; REC: driver
(define driver
  (lambda (id name train-maker)
    (list id name train-maker)))
;; Req 18. TDA subway - Constructor: Función que permite crear una red de metro.
;; DOM: id (int) X nombre (string)
;; REC: subway
(define subway
  (lambda (id name)
    (list id name)))
;; Req 19. TDA subway - Modificador: Función que permite añadir trenes a una red de metro. Emplear algún tipo de recursividad.
;; DOM: sub (subway) X train+ (pueden ser 1 o más trenes)
;; REC: subway
(define subway-add-train
  (lambda (sub . train+)
    (define fn-interna
      (lambda (sub train+ acc)
        (cond
          [(null? train+) (list sub (reverse acc))]
          [else (fn-interna sub (cdr train+) (cons (car train+) acc))])))
    (fn-interna sub train+ null)))
;; Req 20. TDA subway - Modificador: Función que permite añadir líneas a una red de metro. No usar recursividad.
;; DOM: sub (subway) X line+ (pueden ser 1 o más líneas)
;; REC: subway
(define subway-add-line
  (lambda (sub . line+)
    (apply append sub (list (list (filter (lambda (line) (line? line)) line+))))))
;; Req 21. TDA subway - Modificador: Función que permite añadir conductores a una red de metro. No usar recursividad.
;; DOM: sub (subway) X driver+ (pueden ser 1 o más conductores)
;; REC: subway
(define subway-add-driver
  (lambda (sub . driver+)
    (apply append sub (list (list driver+)))))
;; Req 22: Función que permite expresar una red de metro en un formato String.
;; DOM: sub (subway)
;; REC: String
(define subway->string
  (lambda (sub)
    (cond
      [(null? sub) ""]
      [(pair? (car sub)) (string-append (subway->string (car sub)) " " (subway->string (cdr sub)))]
      [(null? (cdr sub)) (format "~a" (first sub))]
      [else (string-append (format "~a" (first sub)) " " (subway->string (cdr sub)))])))
;; Req 23. TDA subway - Modificador: Función que permite aumentar o reducir los costos de todos los tramos en base a una función especificada por el
;; usuario que arroja un cambio porcentual en los costos. No usar recursividad. Considere que las funciones de costo deben ser currificadas.
;; DOM: sub (subway) X function
;; REC: subway
(define subway-rise-section-cost
  (lambda (sub fn)
    (list
     (get-subway-id-and-name sub)
     (get-subway-trains sub)
     (subway-lines-interna (get-subway-lines sub) fn)
     (get-subway-drivers sub))))
;; Req 24. TDA subway - Modificador: Función que permite modificar el tiempo de parada de una estación. No usar recursividad.
;; DOM: sub (subway) X stationName (String) X time
;; REC: subway
(define subway-set-station-stoptime
  (lambda (sub station-name time)
    (list
     (get-subway-id-and-name sub)
     (get-subway-trains sub)
     (subway-lines-interna-2 (get-subway-lines sub) station-name time)
     (get-subway-drivers sub))))
;; Req 25. TDA subway - Modificador: Función que permite asignar un tren a una línea.
;; DOM: sub (subway) X train-id (int) X line-id (int)
;; REC: subway
(define subway-assign-train-to-line
  (lambda (sub train-id line-id)
    (if (and (member train-id (map (lambda (train) (get-train-id train)) (get-subway-trains sub)))
             (member line-id (map (lambda (line) (get-line-id line)) (get-subway-lines sub))))
        (list
         (get-subway-id-and-name sub)
         (get-subway-trains sub)
         (map (lambda (line) (assign-train-id-to-line line train-id line-id)) (get-subway-lines sub))
         (get-subway-drivers sub))
        (list
         (get-subway-id-and-name sub)
         (get-subway-trains sub)
         (get-subway-lines sub)
         (get-subway-drivers sub)))))
;; Req 26. TDA subway - Modificador. Función que permite asignar un conductor a un tren en un horario de salida determinado considerando estación de partida y de llegada.
;; DOM: sub (subway) X driver-id (int) X train-id (int) X departure-time (String en formato HH:MM:SS de 24 hrs) X departure-station (String) X arrival-station (String)
;; REC: subway
(define subway-assign-driver-to-train
  (lambda (sub driver-id train-id departure-time departure-station arrival-station)
    (if (member train-id (map (lambda (line) (first (get-train-assigned-to-line (get-line-sections line)))) (get-subway-lines sub)))
        (list
         (get-subway-id-and-name sub)
         (get-subway-trains sub)
         (map (lambda (line) (assign-driver-to-train line driver-id train-id departure-time departure-station arrival-station)) (get-subway-lines sub))
         (get-subway-drivers sub))
        (list
         (get-subway-id-and-name sub)
         (get-subway-trains sub)
         (get-subway-lines sub)
         (get-subway-drivers sub)))))