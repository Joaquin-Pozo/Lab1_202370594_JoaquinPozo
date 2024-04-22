#lang scheme
;; Laboratorio 1: Scheme
;; Estudiante: Joaquín Pozo Garrao

(require "TDA_station.rkt" "TDA_line.rkt" "TDA_section.rkt" "TDA_pcar.rkt")

;: Req 2: Funcion constructora de estaciones de metro - TDA Constructor
;: DOM: id (int) X nombre (str) X tipo (str) X tiempo-parada (int)
;: REC: station (list)

(define t "terminal")
(define c "combinacion")
(define r "regular")
(define m "mantencion")
(define station
  (lambda (id name type stop-time)
    (list id name type stop-time)))

;creando una nueva estación
(define e0 (station 1 "USACH" c 30))
(define e1 (station 2 "Estación Central" c 45))
(define e2 (station 3 "ULA" r 45))
(define e3 (station 4 "República" r 45))
(define e4 (station 5 "Los Héroes" c 60))
(define e5 (station 6 "Toesca" r 40))
(define e6 (station 7 "La Moneda" r 40))
(define e7 (station 8 "Cochera" m 3600))
(define e8 (station 9 "Parque OHiggins" r 30))
(define e9 (station 10 "San Pablo" t 40))
(define e10 (station 11 "Los Dominicos" t 60))
;e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10

;: Req 3: Funcion constructora de enlaces entre dos estaciones de metro - TDA Constructor
;: DOM: point1 (station) X point2 (station) X distance (positive-number) X cost (positive-number U {0}). 
;: REC: section (list)

(define section
  (lambda (point1 point2 distance cost)
    (list point1 point2 distance cost)))

;creando una nueva sección
(define s0 (section e0 e1 2 50))
(define s1 (section e1 e2 2.5 55))
(define s2 (section e2 e3 1.5 30))
(define s3 (section e3 e4 3 45))
(define s4 (section e4 e5 3 45))
(define s5 (section e4 e6 1.4 50))
(define s6 (section e5 e8 2 40))
(define s7 (section e0 e7 3 0))
(define s8 (section e0 e9 7 100))
(define s9 (section e6 e10 15 250))

;: Req 4: Funcion constructora de una linea de metro - TDA Constructor
;: DOM: id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;: REC: line (list)
(define line
  (lambda (id name rail-type . sections)
    (list id name rail-type sections)))

(define l0 (line 0 "Línea 0" "UIC 60 ASCE"))
(define l1 (line 1 "Línea 1" "100 R.E." s0 s1 s2 s3 s5 s7 s8 s9))
;; Req 5: Funcion que permite determinar el largo total de una línea (en la unidad de medida expresada en cada tramo)
;; DOM: line (line)
;; REC: positive-number (int)
(define line-length (lambda (line) (apply + (map (lambda (section) (get-section-distance section)) (get-line-sections line)))))
;; Req 6: Función que permite determinar el trayecto entre una estación origen y una final
;; DOM: line (line) X station1-name (String) X station2-name (String)
;; REC: positive-number (int)
(define line-section-length
  (lambda (line station1-name station2-name)
    (get-section-distance (first (filter (section-contains-stations? station1-name station2-name) (get-line-sections line))))))
;; Req 7: Función que permite determinar el costo total (monetario) de recorrer una línea. Resolver con recursividad natural.
;; DOM: line (line)
;; REC: positive-number U {0}
(define line-cost
  (lambda (line)
    (define intern-line-cost
      (lambda (sections)
        (if (null? sections)
            0
            (+ (get-section-cost (first sections)) (intern-line-cost (cdr sections))))))
    (intern-line-cost (get-line-sections line))))
;(line-cost l1)

;; Req 8: Función que permite determinar el costo de un trayecto entre una estación origen y una final. Resolver con recursividad de cola.
;; DOM: line (line) X station1-name (String) X station2-name (String)
;; REC: positive-number U {0}
(define line-section-cost
  (lambda (line station1-name station2-name)
    (define intern-line-section-cost
      (lambda (sections station1-name station2-name cost)
        (cond
          [(null? sections) cost]
          [else
           (if ((section-contains-stations? station1-name station2-name) (first sections))
               (intern-line-section-cost (cdr sections) station1-name station2-name (+ cost (get-section-cost (first sections))))
               (intern-line-section-cost (cdr sections) station1-name station2-name cost))])))
    (intern-line-section-cost (get-line-sections line) station1-name station2-name 0)))
;(line-section-cost l1 "USACH" "San Pablo")

;; Req 9: Función que permite añadir tramos a una línea
;; DOM: line (line) X section (section)
;; REC: line

;; crear funcion que verifique si un tramo está duplicado
;; verificar si el nombre de la estacion y el id no esten duplicados
;; (member "nombre-nueva-seccion"())
(define get-section-id-station1 (lambda (section) (first (first section))))
(define get-section-id-station2 (lambda (section) (first (second section))))

(define line-add-section
  (lambda (line section)
    (define intern-line-add-section
      (lambda (sections section)
        (cond
          [(null? sections) (list section)]
          [else
           (cons (car sections) (intern-line-add-section (cdr sections) section))])))
    (intern-line-add-section (get-line-sections line) section)))

(define e11 (station 12 "Baquedano" "t" 40))
(define s10 (section e10 e11 5 20))

;(line-add-section l1 s10)

;; Req 10: Función que permite determinar si un elemento cumple con las restricciones señaladas en apartados anteriores en
;; relación a las estaciones y tramos para poder conformar una línea. Ocupar un acumulador
;; DOM: line (line)
;; REC: boolean
;; (line? l0)
;; (line? l1)


;; Req 11: Función que permite crear los carros de pasajeros que conforman un convoy. Los carros pueden ser de
;; tipo terminal (tr) o central (ct)
;; DOM: id (int) X capacity (positive integer) X model (string) X type (car-type)
;; REC: pcar

(define tr "terminal")
(define ct "central")

(define pcar
  (lambda (id capacity model type)
    (list id capacity model type)))

;creando carros
(define pc0 (pcar 0 100 "NS-74" ct))
(define pc1 (pcar 1 100 "NS-74" tr))
(define pc2 (pcar 2 150 "NS-74" tr))
(define pc3 (pcar 3 100 "NS-74" ct))
(define pc4 (pcar 4 100 "AS-2014" ct))
(define pc5 (pcar 5 100 "AS-2014" ct))
(define pc6 (pcar 6 100 "AS-2016" ct))
(define pc7 (pcar 4 100 "NS-74" ct))
(define pc8 (pcar 5 100 "NS-74" tr))
(define pc9 (pcar 6 100 "NS-74" ct))
;pc0 pc1 pc2 pc3 pc4 pc5 pc6

;; Req 12: Función que permite crear un tren o convoy
;; DOM: id (int) X maker (string) X rail-type (string) X speed (positive number) X station-stay-time (positive number U {0}) X pcar*
;; REC: train

(define train
  (lambda (id maker rail-type speed station-stay-time . pcar)
    (cond
      [(null? pcar) (list id maker rail-type speed station-stay-time pcar)]
      [(and
        (same-models? (get-pcar-models pcar))
        (correct-order? (get-pcar-types pcar))) (list id maker rail-type speed station-stay-time pcar)]
      [else (list id maker rail-type speed station-stay-time null)])))

(define t2 (train 2 "CAF" "UIC 60 ASCE" 60 1.5 pc1 pc0 pc7 pc8))
t2

