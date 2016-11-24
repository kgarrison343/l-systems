(load "utilities.lisp")

(defun apply-rules (c rules)
  (if rules
      (if (string= c (caar rules))
	  (second (first rules))
	  (apply-rules c (rest rules)))
      (string c)))

(defun generate-l-string (axiom rules)
  (list-to-string (map 'list #'(lambda (c) (apply-rules c rules)) axiom)))

(defun iterate-l-string (axiom rules iterations)
  (if (= 0 iterations)
      axiom
      (iterate-l-string (generate-l-string axiom rules) rules (- iterations 1))))
