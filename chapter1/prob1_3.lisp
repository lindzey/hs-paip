;; I'm choosing to have () and nil count as atoms b/c they aren't evaulated
;; in the list until I pull them off w/ (first ...)
;; It would be easy enough to add another case in the cond statement to 
;; ignore them

(defun count-atoms (expr)
  (cond ((atom expr) 1)
	((= 1 (length expr)) 1)
	(t (+ (count-atoms (first expr)) (count-atoms (rest expr))))))
