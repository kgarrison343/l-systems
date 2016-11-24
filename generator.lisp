(load "utilities.lisp")

(defun apply-rules (c rules)
  (if rules
      (if (string= c (caar rules))
	  (second (first rules))
	  (apply-rules c (rest rules)))
      c))

(defun generate-l-string (axiom rules)
  (list-to-string (map 'list #'(lambda (c) (apply-rules c rules)) axiom)))
