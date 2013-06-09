(defun power (base exp) 
  (if (= 1 exp)
      base
      (* base (power base (- exp 1)))))

;; used to test:
; (power 2 10)
; (power 3 3)
; (power 3 2)
