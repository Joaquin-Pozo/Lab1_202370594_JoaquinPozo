#lang scheme
(require "main_202370594_PozoGarrao.rkt")
;Estaciones L1 simplificada metro santiago
(define e0 (station 0 "San Pablo" t 90))
(define e1 (station 1 "Neptuno" r 45))
(define e2 (station 2 "Pajaritos" c 45))
(define e3 (station 3 "Las Rejas" r 45))
(define e4 (station 4 "Ecuador" r 60))
(define e5 (station 5 "San Alberto Hurtado" r 40))
(define e6 (station 6 "Universidad de Santiago de Chile" c 40))
(define e7 (station 7 "Estación Central" c 45))
(define e8 (station 8 "Unión Latinoamericana" r 30))
(define e9 (station 9 "República" r 40))
(define e10 (station 10 "Los Héroes" c 60))
(define e11 (station 11 "La Moneda" r 40))
(define e12 (station 12 "Universidad de Chile" c 90))
(define e13 (station 13 "Santa Lucía" r 40))
(define e14 (station 14 "Universidad Católica" c 60))
(define e15 (station 15 "Baquedano" r 40))
(define e16 (station 16 "Los Dominicos" t 90))
(define e17 (station 17 "Cochera Neptuno" m 3600))

;Estaciones L2 simplificada metro santiago, para una versión circular
(define e18 (station 18 "El Llano" r 60))
(define e19 (station 19 "Franklin" r 50))
(define e20 (station 20 "Rondizzoni" r 55))
(define e21 (station 21 "Parque O'Higgins" r 65))
(define e22 (station 22 "Toesca" r 65))
(define e23 (station 23 "Santa Ana" c 65))
(define e24 (station 24 "Puente Cal y Canto" r 65))

;; Ejemplo 1: estaciones L3 simplificada
(define e25 (station 25 "Los Libertadores" t 9))
(define e26 (station 26 "Vivaceta" r 2))
(define e27 (station 27 "Plaza Chacabuco" r 24))
(define e28 (station 28 "Puente Cal y Canto" m 31))
(define e29 (station 29 "Universidad de Chile" c 15))
(define e30 (station 30 "Matta" r 78))
(define e31 (station 31 "Irarrázaval" c 33))
(define e32 (station 32 "Ñuñoa" c 22))

;; Ejemplo 2: estaciones L4a
(define e33 (station 33 "Vicuña Mackenna" t 20))
(define e34 (station 34 "Santa Julia" r 46))
(define e35 (station 35 "La Granja" m 87))
(define e36 (station 36 "Santa Rosa" r 38))
(define e37 (station 37 "San Ramón" r 29))
(define e38 (station 38 "La Cisterna" t 3))

;; Ejemplo 3: estaciones L6
(define e39 (station 39 "Cerrillos" t 60))
(define e40 (station 40 "Lo Valledor" r 10))
(define e41 (station 41 "Pdte. Pedro Aguirre Cerda" r 44))
(define e42 (station 42 "Franklin" c 50))
(define e43 (station 43 "Biobío" m 77))
(define e44 (station 44 "Ñuble" c 99))
(define e45 (station 45 "Estadio Nacional" r 19))
(define e46 (station 46 "Ñuñoa" c 66))
(define e47 (station 47 "Inés de Suárez" r 27))
(define e48 (station 48 "Los Leones" t 63))

;Tramos Línea 1
(define s0 (section e0 e1 4 15))
(define s1 (section e1 e2 3 14))
(define s2 (section e2 e3 2.5 10))
(define s3 (section e3 e4 4.5 17))
(define s4 (section e4 e5 4.7 18))
(define s5 (section e5 e6 4.3 17))
(define s6 (section e6 e7 3.8 12))
(define s7 (section e7 e8 2.5 10))
(define s8 (section e8 e9 4.5 17))
(define s9 (section e9 e10 4.7 18))
(define s10 (section e10 e11 4.3 17))
(define s11 (section e11 e12 3.8 12))
(define s12 (section e12 e13 4.5 17))
(define s13 (section e13 e14 4.7 18))
(define s14 (section e14 e15 4.3 17))
(define s15 (section e15 e16 4.2 17))
;enlace cochera
(define s16 (section e1 e17 3.8 12))

;Tramos Línea 2, línea circular
(define s17 (section e18 e19 4 15))
(define s18 (section e19 e20 3 12))
(define s19 (section e20 e21 5 18))
(define s20 (section e21 e22 4.5 16))
(define s21 (section e22 e10 4.2 16))
(define s22 (section e10 e23 4.2 16))
(define s23 (section e23 e24 4.2 16))
(define s24 (section e24 e18 28 90));excepcion

;Ejemplo 1: Tramos Línea 3
(define s25 (section e25 e26 9 20))
(define s26 (section e26 e27 1.2 12))
(define s27 (section e27 e28 5.2 14))
(define s28 (section e28 e29 6.9 9))
(define s29 (section e29 e30 3 25))
(define s30 (section e30 e31 8 11))
(define s31 (section e31 e32 6.5 8))

;Ejemplo 2: Tramos Línea 4a
(define s32 (section e33 e34 2.1 20))
(define s33 (section e34 e35 6.2 11))
(define s34 (section e35 e36 4.7 10))
(define s35 (section e36 e37 6.1 15))
(define s36 (section e37 e38 5.4 15))

;Ejemplo 3: Tramos Línea 6
(define s37 (section e39 e40 1.1 10))
(define s38 (section e40 e41 3.5 10))
(define s39 (section e41 e42 6.5 12))
(define s40 (section e42 e43 4.4 7))
(define s41 (section e43 e44 6.6 18))
(define s42 (section e44 e45 9.9 6))
(define s43 (section e45 e46 8.8 19))
(define s44 (section e46 e47 4.2 5))
(define s45 (section e47 e48 9.4 15))

;Creación de Línea 1 con todos los tramos
(define l1 (line 1 "Línea 1" "UIC 60 ASCE" s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15))
;Creación de Línea 2 sin incluir tramos
(define l2 (line 2 "Línea 2" "100 R.E."))

; Ejemplo 1: Creacion de Linea 3
(define l3 (line 3 "Línea 3" "80 ASCE" s25 s26 s27 s28 s29 s30 s31))
; Ejemplo 2: Creacion de Linea 4a
(define l4a (line 4 "Línea 4a" "120 ASCE" s32 s33 s34 s35 s36))
; Ejemplo 3: Creacion de Linea 6 (faltan agregar secciones)
(define l6 (line 6 "Línea 6" "250 R.E." s37 s38 s39 s40 s41 s42))


(line-length l1) ;resultado debe ser 64,3 si considera inclusive los tramos hacia estaciones de mantenimiento 
(line-length l2) ;resultado debe ser 0
; Ejemplo 1: linea 3
(line-length l3) ; 39.8 considerando estaciones de mantenimiento
; Ejemplo 2: linea 4a
(line-length l4a) ; 24.5 considerando estaciones de mantenimiento
; Ejemplo 3: linea 6
(line-length l6) ; 32.0 considerando estaciones de mantenimiento

l3 l4a l6
(line-section-length l1 "San Pablo" "Las Rejas")   ;respuesta es 9.5
; Ejemplo 1: linea 3
(line-section-length l3 "Los Libertadores" "Puente Cal y Canto") ; 15.4
; Ejemplo 2: linea 4a
(line-section-length l4a "Vicuña Mackena" "Santa Julia") ; 2.1
; Ejemplo 3: linea 6
(line-section-length l6 "Franklin" "Estadio Nacional") ; 20.9


(line-cost l1) ;resultado debe ser 246 si considera inclusive los tramos hacia estaciones de mantenimiento 
(line-cost l2) ;resultado debe ser 0
; Ejemplo 1: linea 3
(line-cost l3) ; 99
; Ejemplo 2: linea 4a
(line-cost l4a) ; 71
; Ejemplo 3: linea 6
(line-cost l6) ; 63



(line-section-cost l1 "San Pablo" "Las Rejas")     ;respuesta es 39

; Ejemplo 1: linea 3
(line-section-cost l3 "Los Libertadores" "Puente Cal y Canto") ; 46
; Ejemplo 2: linea 4a
(line-section-cost l4a "Vicuña Mackenna" "Santa Julia") ; 20
; Ejemplo 3: linea 6
(line-section-cost l6 "Franklin" "Estadio Nacional") ; 31




;añadiendo tramos a l2
(define l2a (line-add-section l2 s17))
(define l2b (line-add-section l2a s18))
(define l2c (line-add-section l2b s19))
(define l2d (line-add-section l2c s20))
(define l2e (line-add-section l2d s21))
(define l2f (line-add-section l2e s22))
(define l2g (line-add-section l2f s23))
(define l2h (line-add-section l2g s24))
(define l2i (line-add-section l2h s19))  ;dependiendo de como implemente la función, esta operación no añade la estación duplicada. Puede lanzar un “error o excepción” (no un mensaje de error como String, para no comprometer el recorrido de la función) o bien devolver la línea de entrada intacta. En este caso, l2i sería igual a l2h. 

;Ejemplo 1: añadiendo las secciones faltantes a l6
(define l6a (line-add-section l6 s43))
;Ejemplo 2: añadiendo las secciones faltantes a l6
(define l6b (line-add-section l6a s44))
;Ejemplo 3: añadiendo las secciones faltantes a l6
(define l6c (line-add-section l6b s45))




(line? l1)  ;devuelve true
(line? l2)  ;devuelve false
(line? l2e)  ;devuelve false
(line? l2h)  ;devuelve true

; Ejemplo 1: linea 3
(line? l3) ; #t
; Ejemplo 2: linea 4a
(line? l4a) ; #t
; Ejemplo 3: linea 6
(line? l6c) ; #t




;creando carros
(define pc0 (pcar 0 100 "NS-74" tr))
(define pc1 (pcar 1 100 "NS-74" ct))
(define pc2 (pcar 2 150 "NS-74" ct))
(define pc3 (pcar 3 100 "NS-74" ct))
(define pc4 (pcar 4 100 "NS-74" tr))
(define pc5 (pcar 5 100 "AS-2014" tr))
(define pc6 (pcar 6 100 "AS-2014" ct))
(define pc7 (pcar 7 100 "AS-2014" ct))
(define pc8 (pcar 8 100 "AS-2014" ct))
(define pc9 (pcar 9 100 "AS-2014" tr))
(define pc10 (pcar 10 100 "AS-2014" tr))
(define pc11a (pcar 11 100 "AS-2016" tr))
(define pc11 (pcar 12 100 "AS-2016" ct))
(define pc12 (pcar 13 100 "AS-2016" ct))
(define pc13 (pcar 14 150 "AS-2016" ct))
(define pc14 (pcar 15 100 "AS-2016" ct))
(define pc15 (pcar 16 100 "AS-2016" ct))
(define pc16 (pcar 17 100 "AS-2016" ct))
(define pc17 (pcar 18 100 "AS-2016" tr))

;Ejemplo 1 agregando carros
(define pc19 (pcar 19 100 "AS-2002" tr))
(define pc20 (pcar 20 100 "AS-2002" ct))
(define pc21 (pcar 21 100 "AS-2002" tr))
;Ejemplo 2 agregando carros
(define pc22 (pcar 22 100 "AS-2002" ct))
(define pc23 (pcar 23 100 "AS-2002" tr))
(define pc24 (pcar 24 100 "AS-2002" ct))
;Ejemplo 3 agregando carros
(define pc25 (pcar 25 100 "AS-2002" tr))
(define pc26 (pcar 26 100 "AS-2002" ct))
(define pc27 (pcar 27 100 "AS-2002" tr))




;creando trenes
(define t0 (train 0 "CAF" "UIC 60 ASCE" 60 1.5)) ;tren sin carros definidos
(define t1 (train 1 "CAF" "UIC 60 ASCE" 70  2 pc0 pc1 pc2 pc3 pc4)) ;tren válido
(define t2 (train 2 "CAF" "100 R.E." 70  2 pc5 pc6 pc7 pc8 pc9)) ;tren válido
(define t3 (train 3 "CAF" "100 R.E." 70  2 pc11a pc11 pc12 pc13 pc14 pc15 pc16 pc17)) ;tren válido
(define t4 (train 4 "CAF" "100 R.E." 70  2 pc1 pc2 pc3)) ;tren inválido sin terminales en extremos
(define t5 (train 5 "CAF" "100 R.E." 70  2 pc0 pc5 pc9 pc12 pc17))  ;tren inválido por incompatibilidad de carros


; Ejemplo 1:
(define t6 (train 6 "CAF" "100 R.E." 20  2 pc19 pc20 pc22 pc26 pc27)) ; tren valido
; Ejemplo 2:
(define t7 (train 7 "CAF" "100 R.E." 50  2 pc26 pc27 pc26 pc24 pc19)) ; tren invalido
; Ejemplo 3:
(define t8 (train 8 "CAF" "100 R.E." 90  2 pc25 pc26 pc24 pc22 pc19)) ; tren valido

(define t0a (train-add-car t0 pc5 0))
(define t0b (train-add-car t0a pc6 1))
(define t0c (train-add-car t0b pc7 2))
(define t0d (train-add-car t0c pc8 3))
(define t0e (train-add-car t0d pc9 4)) ;tren válido

; Ejemplo 1:
(define t6a (train-add-car t6 pc5 0))
; Ejemplo 2:
(define t7a (train-add-car t7 pc17 3))
; Ejemplo 3:
(define t8a (train-add-car t8 pc27 1))

(define t1a (train-remove-car t1 0))
(define t1b (train-remove-car t1 2))

; Ejemplo 1:
(define t6b (train-remove-car t6a 0))
; Ejemplo 2:
(define t7b (train-remove-car t7a 3))
; Ejemplo 3:
(define t8b (train-remove-car t8a 4))




;verificación de válidez en la conformación de trenes
(train? t0) ;debe arrojar #f
(train? t1) ;debe arrojar #t
(train? t2) ;debe arrojar #t
(train? t3) ;debe arrojar #t
(train? t4) ;debe arrojar #f
(train? t0a) ;debe arrojar #f
(train? t0b) ;debe arrojar #f
(train? t0c) ;debe arrojar #f
(train? t0d) ;debe arrojar #f
(train? t0e) ;debe arrojar #t
(train? t1a) ;debe arrojar #f
(train? t1b) ;debe arrojar #t

; Ejemplo 1:
(train? t6b) ;debe arrojar #t
; Ejemplo 2:
(train? t8) ;debe arrojar #t
; Ejemplo 3:
(train? t8b) ;debe arrojar #f

;determinar capacidad del tren
(train-capacity t0) ;debe arrojar 0
(train-capacity t1) ;debe arrojar 550

; Ejemplo 1:
(train-capacity t6) ;debe arrojar 500
; Ejemplo 2:
(train-capacity t7) ;debe arrojar 0
; Ejemplo 3:
(train-capacity t8) ;debe arrojar 500


;Creando drivers
(define d0 (driver 0 "Juan" "CAF"))
(define d1 (driver 1 "Alejandro" "Alsthom"))
(define d2 (driver 2 "Diego" "Alsthom"))
(define d3 (driver 3 "Pedro" "CAF"))

; Ejemplo 1:
(define d4 (driver 4 "José" "CAF"))
; Ejemplo 2:
(define d5 (driver 5 "María" "CAF"))
; Ejemplo 3:
(define d6 (driver 6 "Carolina" "CAF"))




;Creando Metros
(define sw0 (subway 0 "Metro de Santiago"))
(define sw1 (subway 1 "Subte"))

; Ejemplo 1:
(define sw2 (subway 2 "Metro de Villarrica"))
; Ejemplo 2:
(define sw3 (subway 3 "Metro de Chillán"))
; Ejemplo 3:
(define sw4 (subway 4 "Metro de Isla de Pascua"))




;Agregando trenes
(define sw0a (subway-add-train sw0 t1 t2 t0e))

; Ejemplo 1:
(define sw2a (subway-add-train sw2 t6 t8))
; Ejemplo 2:
(define sw3a (subway-add-train sw3 t1 t6 t2))
; Ejemplo 3:
(define sw4a (subway-add-train sw4 t8 t1 t2))

;Agregando lineas
(define sw0b (subway-add-line sw0a l1 l2h))

; Ejemplo 1:
(define sw2b (subway-add-line sw2a l3 l4a))
; Ejemplo 2:
(define sw3b (subway-add-line sw3a l6c l3))
; Ejemplo 3:
(define sw4b (subway-add-line sw4a l4a l6c))

;Agregando drivers
(define sw0c (subway-add-driver sw0b d0 d1 d2 d3))

; Ejemplo 1:
(define sw2c (subway-add-driver sw2b d4 d5 d6))
; Ejemplo 2:
(define sw3c (subway-add-driver sw3b d0 d4 d2 d5))
; Ejemplo 3:
(define sw4c (subway-add-driver sw4b d3 d5 d2))

;Expresado subway como string
(subway->string sw0c)

; Ejemplo 1:
(subway->string sw2c)
; Ejemplo 2:
(subway->string sw3c)
; Ejemplo 3:
(subway->string sw4c)

;Aumentando los costos de las estaciones en un 30%
(define sw0d (subway-rise-section-cost sw0c (lambda (c) (* c 1.3))))

; Ejemplo 1:
(define sw2d (subway-rise-section-cost sw2c (lambda (c) (* c 0.5))))
; Ejemplo 2:
(define sw3d (subway-rise-section-cost sw3c (lambda (c) (* c 1.6))))
; Ejemplo 3:
(define sw4d (subway-rise-section-cost sw4c (lambda (c) (* c 0.9))))

;Cambiando el tiempo de parada de algunas estaciones
(define sw0e (subway-set-station-stoptime sw0d "Los Héroes" 180))
(define sw0f (subway-set-station-stoptime sw0e "San Pablo" 50))

; Ejemplo 1:
(define sw2e (subway-set-station-stoptime sw2d "Pdte. Pedro Aguirre Cerda" 15))
; Ejemplo 2:
(define sw3e (subway-set-station-stoptime sw3d "Inés de Suarez" 110))
; Ejemplo 3:
(define sw4e (subway-set-station-stoptime sw4d "Franklin" 63))

;Asignando trenes a líneas
(define sw0g (subway-assign-train-to-line sw0f 0 1))
(define sw0h (subway-assign-train-to-line sw0g 2 2))

; Ejemplo 1:
(define sw2f (subway-assign-train-to-line sw2e 6 4))
; Ejemplo 2:
(define sw3f (subway-assign-train-to-line sw3e 2 6))
; Ejemplo 3:
(define sw4f (subway-assign-train-to-line sw4e 8 4))

;Asignando conductores a trenes
(define sw0i (subway-assign-driver-to-train sw0h 0 0 "11:00:00" "San Pablo" "Los Héroes"))
(define sw0j (subway-assign-driver-to-train sw0i 2 2 "12:00:00" "El Llano" "Toesca"))

; Ejemplo 1:
(define sw2g (subway-assign-driver-to-train sw2f 5 6 "09:35:00" "La Granja" "La Cisterna"))
; Ejemplo 2:
(define sw3g (subway-assign-driver-to-train sw3f 4 2 "23:14:00" "Biobío" "Los Leones"))
; Ejemplo 3:
(define sw4g (subway-assign-driver-to-train sw4f 3 8 "15:00:00" "Vicuña Mackenna" "San Ramón"))

sw2g sw3g sw4g


;; Funciones 27 y 28 no fueron implementadas
#|
;preguntando dónde está el tren
(where-is-train sw0j 0 "11:12:00")  ;Debería estar mas cerca de Las Rejas. Hasta esta hora el tren debería haber recorrido 12km (asumiendo esta unidad), sumando los tiempos de parada en las estaciones


;produciendo la ruta que sigue el tren
(subway-train-path sw0j 0 “11:30:00”)
|#
