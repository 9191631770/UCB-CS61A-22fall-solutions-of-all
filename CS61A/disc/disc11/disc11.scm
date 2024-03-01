;question3
(define (if-program condition if-true if-false)
   `(if ,condition ,if-true ,if-false)
)

;question4
(define (pow-expr n p)
    (if (= p 0) '1 
        `(* ,(pow-expr n (- p 1)) ,n)
))

;question5
(define (cddr s)
  (cdr (cdr s))
)

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (swap expr)
    (let ((op (car expr))
        (first (car (cdr expr)))
        (second (caddr expr))
        (rest (cdr (cddr expr))))
        (if (> (eval first) (eval second)) expr
            `(,op ,second ,first ,rest))
    )
)

;question6
(define (make-or expr1 expr2)
    `(let ((v1 (eval ,expr1)))
        (if v1 v1 ,expr2))
)

;question7
(define (make-make-or)
    '(define (make-or expr1 expr2)
    `(let ((v1 (eval ,expr1)))
        (if v1 v1 ,expr2))
     )
)



