(define (vir-fib n)
    (if (= n 0)
        0
        (if (= n 1)
            1
            (+ (vir-fib (- n 1)) (vir-fib (- n 2)))
        )    
    )
)

(define with-list
    (list
        (list
            'a 'b
        ) 
        'c 'd (list
                  'e
              )
    )
)

(define with-quote
    '(
        (a b) c d (e)
    )
)

(define helpful-list
   (cons 'a (cons 'b nil)))
(draw helpful-list)

(define another-helpful-list
    (cons 'c (cons 'd (cons (cons 'e nil) nil))))
(draw another-helpful-list)

(define with-cons
    (cons
        (cons 'a (cons 'b nil))
        (cons 'c (cons 'd (cons
                              (cons 'e nil) nil)))
    )
)

(define (list-concat a b)
    (if (null? (cdr a))
        (cons (car a) b)
        (cons (car a) (list-concat (cdr a) b))
    )
)

(define (map-fn fn lst)
    (if (null? (cdr lst))
        (cons (fn (car lst)) nil)
        (cons (fn (car lst)) (map-fn fn (cdr lst)))
    
    )
)

(define (remove item lst)
    (if (null? lst)
        nil
        (if (= (car lst) item)
            (remove item (cdr lst))
            (cons (car lst) (remove item (cdr lst))
            )
        )
    )
)