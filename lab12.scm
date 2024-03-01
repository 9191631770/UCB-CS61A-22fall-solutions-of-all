(define-macro (if-macro condition if-true if-false)
   (list 'if condition if-true if-false)
)

(define-macro (or-macro expr1 expr2)
  `(let ((v1 ,expr1))
     (if v1
         v1
         ,expr2)))

(define (replicate x n) 
    (if (= n 0)
        nil
        (cons x (replicate x (- n 1)))))

(define-macro (repeat-n expr n) 
    `(if (equal? ,(eval n) 1)
         ,expr
         (begin ,expr (repeat-n ,expr ,(- (eval n) 1)))))
        