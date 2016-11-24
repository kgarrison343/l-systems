(defun list-to-string (list-of-strings)
  (reduce #'(lambda (x y) (concatenate 'string x y)) list-of-strings))
