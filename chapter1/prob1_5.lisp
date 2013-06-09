(defun dot-product (list1 list2) 
  (if (or (= 0 (length list1)) (= 0 (length list2)))
      0
      (+ (* (first list1) (first list2)) (dot-product (rest list1) (rest list2)))))

;; tested with
; (dot-product '(1 2 3 4) '(1 2 3)) => 14
; (dot-product '(1 2 3 4) '(1 2 3 4 5)) => 30
; (dot-product '(10 20) '(3 4)) => 110
