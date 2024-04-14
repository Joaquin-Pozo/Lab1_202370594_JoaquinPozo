#lang scheme
;; Laboratorio 1: Scheme
;; Estudiante: Joaquín Pozo Garrao

;: Req 2: Funcion constructora de estaciones de metro - TDA Constructor
;: DOM: id (int) X nombre (str) X tipo (str) X tiempo-parada (int)
;: REC: station (list)
(define station
  (lambda (id name type stop-time)
    (list id name type stop-time)))

;creando una nueva estación
(define e0 (station 1 "USACH" "c" 30))
(define e1 (station 2 "Estación Central" "c" 45))
(define e2 (station 3 "ULA" "r" 45))
(define e3 (station 4 "República" "r" 45))
(define e4 (station 5 "Los Héroes" "c" 60))
(define e5 (station 6 "Toesca" "r" 40))
(define e6 (station 7 "La Moneda" "r" 40))
(define e7 (station 8 "Cochera" "m" 3600))
(define e8 (station 9 "Parque OHiggins" "r" 30))
(define e9 (station 10 "San Pablo" "t" 40))
(define e10 (station 11 "Los Dominicos" "t" 60))
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
;s0 s1 s2 s3 s4 s5 s6 s7 s8 s9

;: Req 4: Funcion constructora de una linea de metro - TDA Constructor
;: DOM: id (int) X name (string) X rail-type (string) X section* (* señala que se pueden agregar 0 o más tramos)
;: REC: line (list)

(define line
  (lambda (id name rail-type . sections)
    (list id name rail-type sections)))

(define l0 (line 0 "Línea 0" "UIC 60 ASCE"))
(define l1 (line 1 "Línea 1" "100 R.E." s0 s1 s2 s3 s5 s7 s8 s9))
;l0 l1

;; TDA: SELECTOR - Funcion adicional que permite obtener todas las secciones de una linea
;; DOM: line (line)
;; REC: sections (sections)
(define get-line-sections (lambda (line) (last line)))
;; TDA: SELECTOR - Funcion adicional que permite obtener todas las secciones de una linea
;; DOM: line (line)
;; REC: sections (sections)
(define get-section-distance (lambda (section) (third section)))
;; Req 5: Funcion que permite determinar el largo total de una línea (en la unidad de medida expresada en cada tramo)
;; DOM: line (line)
;; REC: positive-number (int)
(define line-length (lambda (line) (apply + (map (lambda (x) (get-section-distance x)) (get-line-sections line)))))

;; Req 6: Función que permite determinar el trayecto entre una estación origen y una final.
;; DOM: line (line) X station1-name (String) X station2-name (String)
;; REC: positive-number (int)
(define get-station1-name (lambda (section) (first (second section))))
(define get-station2-name (lambda (section) (second (second section))))
(define section-contains-stations? (lambda (section station1-name station2-name)
                                     (and
                                      (eq? (get-station1-name section) station1-name)
                                      (eq? (get-station2-name section) station2-name))))
(define line-section-length (lambda (line station1-name station2-name)
                              (map (lambda (x) (get-station1-name x)) (get-line-sections line))))
(line-section-length l1 "USACH" "Estación Central")






