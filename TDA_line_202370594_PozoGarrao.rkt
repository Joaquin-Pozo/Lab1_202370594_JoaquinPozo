#lang scheme
(require "TDA_section_202370594_PozoGarrao.rkt")
(provide get-line-sections get-line-id get-line-name get-line-rail-type get-train-assigned-to-line get-first-line-section fn-add-section duplicated-sections?)

;; TDA: SELECTOR - Funcion adicional que permite obtener todas las secciones de una linea
;; DOM: line (line)
;; REC: list of sections
(define get-line-sections (lambda (line) (fourth line)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el id de una linea
;; DOM: line (line)
;; REC: id (int)
(define get-line-id (lambda (line) (first line)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el nombre de una linea
;; DOM: line (line)
;; REC: name (string)
(define get-line-name (lambda (line) (second line)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tipo de carril de una linea
;; DOM: line (line)
;; REC: rail-type (string)
(define get-line-rail-type (lambda (line) (third line)))
;; TDA: SELECTOR - Funcion adicional que permite obtener el tren asignado a una linea
;; DOM: section (section)
;; REC: train-id (int)
(define get-train-assigned-to-line (lambda (section) (last section)))
;; TDA: SELECTOR - Funcion adicional que permite obtener la primera sección de una linea
;; DOM: sections (list)
;; REC: section (section)
(define get-first-line-section (lambda (line-sections) (first line-sections)))
;; TDA: MODIFICADOR - Funcion adicional que permite agregar secciones a una línea y comprueba si la sección está duplicada
;; DOM: list of sections X new_section (section)
;; REC: list of sections
(define fn-add-section
  (lambda (line-sections section)
    (cond
      [(null? line-sections) (if (null? section) null (cons section null))]
      [(equal? (car line-sections) section)
       (cons (car line-sections) (fn-add-section (cdr line-sections) null))]
      [else (cons (car line-sections) (fn-add-section (cdr line-sections) section))])))
;; TDA: VALIDADOR - Funcion adicional que permite verificar si una linea tiene secciones duplicadas
;; DOM: list of sections
;; REC: #t | #f (boolean)
(define duplicated-sections?
  (lambda (line-sections)
    (cond
      [(null? line-sections) #f]
      [(member (car line-sections) line-sections) #t]
      [else (duplicated-sections? (cdr line-sections))])))
