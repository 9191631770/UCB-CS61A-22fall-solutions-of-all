(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate lst)
    (define (helper lst n)
        (if (null? lst)
            nil
            (cons (cons n (cons (car lst) nil)) (helper (cdr lst) (+ n 1)))
        ))
    (helper lst 0)
    )

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge comp lst1 lst2)
    (cond ((null? lst1) lst2)
          ((null? lst2) lst1)
          (else 
                (if (comp (car lst1) (car lst2))
                    (cons (car lst1) (merge comp (cdr lst1) lst2))
                    (cons (car lst2) (merge comp (cdr lst2) lst1)))
                )))

;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
           expr
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
           expr
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           (cons form (cons params (map let-to-lambda body)))
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           (define executed (zip values))
           (define params (car executed))
           (define args (cadr executed))
           ;(list (list 'lambda params (car body) args))
           (append (cons (cons 'lambda (cons params (map let-to-lambda body))) nil) (map let-to-lambda args))
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
          (cons (car expr) (map let-to-lambda (cdr expr)))
         ; END OPTIONAL PROBLEM 2
         )))

(let-to-lambda '(lambda (x) a (let ((a x)) a)))
(lambda (x) a ((lambda (a) a) x))
; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
    (define (arg1 pairs)
        (map (lambda (pair) (car pair)) pairs))
    (define (arg2 pairs)
        (map (lambda (pair) (car (cdr pair))) pairs))
    (list (arg1 pairs) (arg2 pairs)))
