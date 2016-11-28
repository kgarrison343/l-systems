(defun list-to-string (list-of-strings)
  "Takes a list of strings and reduces it over the concatenate method (because I couldn't find a simpler way to do that even though I'm sure one exists)."
  (reduce #'(lambda (x y) (concatenate 'string x y)) list-of-strings))
