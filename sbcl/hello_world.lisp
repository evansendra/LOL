(defparameter *fish* "big tuna")    ; global variable
(defconstant FREUD 69)              ; global constant

(defun whatup (string)
	(format t "~a: " string)
	(finish-output) ; b/c output is buffered
	(say (read)))

(defun say (msg)
	(format t "~a~%" msg))

(defun simple-hasp (obj lst)
	(if (null lst)
		nil
		(if (eql obj (car lst))
			T
			(simple-hasp obj (cdr lst)))))


(defun hasp (obj lst comp)
	(if (null lst)
		nil
		(if (funcall comp (car lst) obj)
			T
			(hasp obj (cdr lst) (function comp)))))

(say (eql "a" "a"))		       ; false
(say (string-equal "a" "a"))   ; true

; this won't work with simple-hasp
(say (hasp "a" '("a" b c d) (function string-equal))) ; true
(say (simple-hasp "a" '("a" b c d))) ; false
(say (simple-hasp 2 '(5 4 3 2 1)))   ; true

; (whatup "was good")

(defun ask-num ()
	(format t "Give a num: ")
	(finish-output)
	(let ((val (read)))      ; note that (let ... starts a lexical scope)
	(if (numberp val)
		(say val)
		(ask-num))))

(say *fish*)
(say FREUD)
(say (boundp '*fish*)) 		 ; check if constant of same name exists
(say (boundp 'FREUD)) 		 ; check if constant of same name exists