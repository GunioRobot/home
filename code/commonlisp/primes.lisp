(defun isprime (x)
  (if (< x 2)
	  (return-from isprime nil)
	(dotimes (i (+ (ceiling (sqrt x)) 1))
	  (if (and (> i 1) (< i x))
		  (if (equal (mod x i) 0)
			  (return-from isprime nil)))))
  (return-from isprime t))

(defun primerange (&key (min 0) (max 10))
  (dotimes (i (- max min))
	(if (isprime (+ i min))
	  (format t "~d is prime~%" (+ i min)))))
