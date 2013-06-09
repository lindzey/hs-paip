; (defparameter suffixes '(Jr. Sr. III MD PhD) "Suffixes that come after last-names, that we're planning to strip off")
;(setf (symbol-value 'suffixes) '(Jr. Sr. III MD PhD))
(set 'suffixes '(Jr. Sr. III MD PhD))

;(setf  (symbol-value 'names) (list '(Charles Greer III) '(Mary Smith PhD) '(Jane Doe MD) '(Rex Harry) '(Lil Man Jr.) '(Big Man Sr.) '(John Doe)))
(set  'names (list '(Charles Greer III) '(Mary Smith PhD) '(Jane Doe MD) '(Rex Harry) '(Lil Man Jr.) '(Big Man Sr.) '(John Doe)))

(defun last-name (name)
  (if (member (first (last name)) suffixes)
      (last-name (reverse (rest (reverse name))))
      (first (last name))))

;; test code 
;(first names)
;(last-name (first names))
;(mapcar #'last-name names)


