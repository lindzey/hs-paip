;; WTF? I can't figure out how to get these functions to call each other :-\
;; I want these two generate functions in their own files, including the book code
;; from this file, but I can't even figure out how to get them to work in this file

;(in-package :CL-USER)

; problem 2.1 - using cond, but only calling rewrites once
(defun generate-one (phrase)
  (let ((available-rewrites (rewrites phrase)))
    (cond ((listp phrase)
	   (mappend #'generate-one phrase))
	  ((null available-rewrites)
	   (list phrase))
	  (t (generate-one (random-elt available-rewrites))))))

; problem 2.2 - version of rewrite that explicitly differentiates between terminal and 
;; non-terminal symbols. I'm confused ... it already does, by checking if it's a list
;; Ah - I peeked at the answers, and what they're going for is a version that doesn't
;; rely on (rewrites phrase) coming back empty and then evaluating to false in the cond. 
(defun non-terminal? (phrase)
  "whether or not the input phrase has rewrite, or is a terminal rule"
  (not (null (rewrites phrase))))

(defun generate-two (phrase)
  (cond ((listp phrase)
	 (mappend #'generate-orig phrase))
	((non-terminal? phrase)
	 (generate-two (random-elt (rewrites phrase))))
	(t (list phrase))))




;; original version of generate from the book
(defun generate-orig (phrase)
  "generate a random sentence or phrase"
  (cond ((listp phrase)
	 (mappend #'generate-orig phrase))
	((rewrites phrase)
	 (generate-orig (random-elt (rewrites phrase))))
	(t (list phrase))))

(defun mappend (fn the-list)
  "apply fn to each element of list and append the results."
  (apply #'append (mapcar fn the-list)))

;; Code from the book creating the grammar

(defun rewrites (category)
  "Return a list of the possible rewrites for this category."
  (rule-rhs (assoc category *grammar*)))

(defun random-elt (choices)
  "Choose an element from a list at random."
  (elt choices (random (length choices))))

(defun rule-lhs (rule)
  "The left-hand side of a rule."
  (first rule))

(defun rule-rhs (rule)
  "The right-hand side of a rule."
  (rest (rest rule)))

(defvar *grammar* *simple-grammar* 
  "The grammar used by generate")


(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked))
  " A grammar for a trivial subset of English.")




