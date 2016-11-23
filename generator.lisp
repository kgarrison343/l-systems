(defun apply-rules (c rules)
  (if rules
      (if (string= c (caar rules))
	  (last (first rules))
	  (apply-rules c (rest rules)))
      c))

(defun generate-l-string (axiom rules)
  (map 'list #'(lambda (c) (apply-rules c rules)) axiom))
