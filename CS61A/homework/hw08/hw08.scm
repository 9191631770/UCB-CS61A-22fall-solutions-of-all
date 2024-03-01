(define (my-filter pred s) 
    (if (null? s) 
         s
         (if (pred (car s))
             (cons (car s) (my-filter pred (cdr s)))
             (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 
    (cond ((null? lst1) lst2)
          ((null? lst2) lst1)
          (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))))

(define (accumulate joiner start n term)
    (define (helper joiner n term)
        (if (= n 1)
        (term 1)
        (joiner (term n) (helper joiner (- n 1) term))))
    (joiner start (helper joiner n term)))

(define (no-repeats lst)
    (define (pred n)
        (not (= n (car lst))))
    (if (null? lst)
        nil
        (cons (car lst) (no-repeats (my-filter pred (cdr lst))))))
