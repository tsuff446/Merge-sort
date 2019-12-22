;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname merge-sort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (merge list1 list2)
  (cond
    [(empty? list1) list2]
    [(empty? list2) list1]
    [(< (first list1) (first list2))
     (cons (first list1) (merge (rest list1) list2))]
    [else
     (cons (first list2) (merge list1 (rest list2)))]
))

(define (macro-merge list-of-list)
  (cond
    [(empty? list-of-list) '()]
    [else (merge (first list-of-list) (macro-merge (rest list-of-list)))])
  )

(define (split a-list)
  (cond
    [(empty? a-list) '()]
    [(empty? (rest a-list)) (cons a-list '())]
    [(< (first a-list) (second a-list))
     (cons (list (first a-list) (second a-list)) (split (rest (rest a-list))))]
    [else
     (cons (list (first a-list)) (split (rest a-list)))]
   )
  )

(define (merge-sort a-list)
  (macro-merge (split a-list))
  )

