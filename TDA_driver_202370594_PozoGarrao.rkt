#lang scheme
(provide get-driver-id)

;; TDA: SELECTOR - Funcion adicional que permite obtener el id de un driver
;; DOM: driver (driver)
;; REC: id (integer)
(define get-driver-id (lambda (driver) (first driver)))