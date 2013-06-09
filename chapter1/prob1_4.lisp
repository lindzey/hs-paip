;; since I want to use member, which needs a list, I'll peel off elements
;; from the input list from the back
;; also - member appears to only work on atoms, not elements??
; (member '(a b) '(a b (a b) (a (a b))))



(defun count-anywhere (expr input)
  (cond ((atom input) 0) ;; 
	((member expr (last input)) (+ 1 
				      (count-anywhere expr (first (last input))) 
				      (count-anywhere expr (remove-last input))))
	(t (+
	     (count-anywhere expr (first (last input))) 
	     (count-anywhere expr (remove-last input))))))

(defun remove-last (expr) (reverse (rest (reverse expr))))

;; tested with 
; (count-anywhere 'a '(a b c a))
; (count-anywhere 'a '(a ((a) b) a))
