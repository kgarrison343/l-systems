(load "utilities.lisp")

(defun apply-rules (c rules)
  "Takes a char c and a list of rules and iterates throughthe list to apply any valid rule to the char. Rules are of the form (start-string end-string)."
  (if rules
      (if (string= c (caar rules))
	  (second (first rules))
	  (apply-rules c (rest rules)))
      (string c)))

(defun generate-l-string (axiom rules)
  "Returns a string of the rules applied to the axiom one time. The axiom param is a string and the rules param is a list of rules of the form (start-string end-string)."
  (list-to-string (map 'list #'(lambda (c) (apply-rules c rules)) axiom)))

(defun iterate-l-string (axiom rules iterations)
  "Returns a string of the rules applied to the axiom a number of times equal to iterations. The axiom param is a string, the rules param is a list of rules of the form (start-string end-string), and the iterations param is a number."
  (if (= 0 iterations)
      axiom
      (iterate-l-string (generate-l-string axiom rules) rules (- iterations 1))))

(defun output-l-string (axiom rules iterations)
  "Outputs the results of iterate-l-string to a file in the working directory called l-file"
  (with-open-file (l-file "l-file" :direction :output :if-exists :supersede)
    (write-line (iterate-l-string axiom rules iterations) l-file)))
