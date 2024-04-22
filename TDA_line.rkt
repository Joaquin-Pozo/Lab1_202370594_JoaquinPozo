#lang scheme
(provide get-line-sections)

;; TDA: SELECTOR - Funcion adicional que permite obtener todas las secciones de una linea
;; DOM: line (line)
;; REC: sections (sections)
(define get-line-sections (lambda (line) (last line)))