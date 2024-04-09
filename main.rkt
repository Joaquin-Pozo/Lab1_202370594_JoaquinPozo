#lang scheme

;: Funcion constructora de estaciones de metro - TDA Constructor
;: DOM: id (int) X nombre (str) X tipo (str) X tiempo-parada (int)
;: REC: estacion (list)
(define estacion
  (lambda (id nombre tipo tiempo)
    (list id nombre tipo tiempo)))

;creando una nueva estación
(define e0 (estacion 1 "USACH" "c" 30))
(define e1 (estacion 2 "Estación Central" "c" 45))
(define e2 (estacion 3 "ULA" "r" 45))
(define e3 (estacion 3 "República" "r" 45))
(define e4 (estacion 4 "Los Héroes" "c" 60))
(define e5 (estacion 5 "Toesca" "r" 40))
(define e6 (estacion 6 "La Moneda" "r" 40))
(define e7 (estacion 7 "Cochera" "m" 3600))
(define e8 (estacion 8 "Parque OHiggins" "r" 30))
(define e9 (estacion 9 "San Pablo" "t" 40))
(define e10 (estacion 10 "Los Dominicos" "t" 60))
e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10