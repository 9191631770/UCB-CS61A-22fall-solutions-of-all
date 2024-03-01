(define (sum lst)
   (define (iter-sum lst result)
     (if (null? lst)
       result
       (iter-sum (cdr lst) (+ result (car lst))))
    )
    (iter-sum lst 0)
)

(expect (sum '(1 2 3)) 6)
(expect (sum '(10 -3 4)) 11)

(define (reverse lst)
  (define (iter-rev lst result)
    (if (null? lst)
      result
      (iter-rev (cdr lst) (cons (car lst) result))))
  (iter-rev lst nil)
)

(expect (reverse '(1 2 3)) (3 2 1))
(expect (reverse '(0 9 1 2)) (2 1 9 0))