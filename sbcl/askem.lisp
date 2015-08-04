(defun askem (what)
	(format t "~a: " what)
	(finish-output)
	(let ((val (read)))
		(if (numberp val)
			val
			(askem what))))

(askem "wassup")
