(load "charmodel.scm")

;; Lab 7: Probability
;; CSC 261
;;
;; File
;;   analysis.scm
;; Summary
;;   A series of computations for Jayne's evidence and likelihoods
;;
;; Provides
;;   (evidence log-likelihood-typist1 log-likelihood-typist2)


;; Procedure
;;   evidence
;;
;; Purpose
;;   To calculate the Jayne's evidence given two likelihoods and a prior
;;   of 0
;;
;; Parameters
;;   log-likelihood-typist1, log-likelihood-typist, numbers
;;
;; Produces
;;   a number
;;
;; Preconditions
;;   [no additonal]
;;   
;; Postconditions
;;   Produces an unidentified number that is the difference between two
;;   logarithms times 10
;;     As scheme does not have a logarithmic function other than the
;;     natural log,
;;     the likelihoods are divided by ln(10) represented here as log 10
;;   
(define evidence
  (lambda (log-likelihood-typist1 log-likelihood-typist2)
   (* 10 (-
    (/ log-likelihood-typist1 (log 10))
    (/ log-likelihood-typist2 (log 10))))))

;;Definitions for original files
(define org1 "/home/weinman/courses/CSC261/data/mills/original/1.txt")
(define org8 "/home/weinman/courses/CSC261/data/mills/original/8.txt")
(define org16 "/home/weinman/courses/CSC261/data/mills/original/16.txt")
(define org4 "/home/weinman/courses/CSC261/data/mills/original/4.txt")
(define org9 "/home/weinman/courses/CSC261/data/mills/original/9.txt")
(define org18 "/home/weinman/courses/CSC261/data/mills/original/18.txt")
(define org3 "/home/weinman/courses/CSC261/data/mills/original/3.txt")
(define org7 "/home/weinman/courses/CSC261/data/mills/original/7.txt")
(define org10 "/home/weinman/courses/CSC261/data/mills/original/10.txt")
(define org11 "/home/weinman/courses/CSC261/data/mills/original/11.txt")
(define org15 "/home/weinman/courses/CSC261/data/mills/original/15.txt")
(define org22 "/home/weinman/courses/CSC261/data/mills/original/22.txt")

;;Definitions for typist one's files
(define typ1-1
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/1.txt")
(define typ1-8
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/8.txt")
(define typ1-16
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist1/16.txt")

;;Definitions for typist two's files
(define typ2-4
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/4.txt")
(define typ2-9
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/9.txt")
(define typ2-18
  "/home/weinman/courses/CSC261/data/mills/corrupted/typist2/18.txt")

;;Definitions for unknown files
(define unknown-3
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/3.txt")
(define unknown-7
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/7.txt")
(define unknown-10
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/10.txt")
(define unknown-11
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/11.txt")
(define unknown-15
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/15.txt")
(define unknown-22
  "/home/weinman/courses/CSC261/data/mills/corrupted/unknown/22.txt")


;; Training on a single letter from each typist and calculate Jaynes's
;; evidence for the typist of each of the other two labeled letter.

;; 1. Training on letter 1, 4, and get the log-likelihood of letter 8
(define countsletter1 (create-counts 28 1))
(count-conditionals! org1 typ1-1 countsletter1)
(normalize-counts! countsletter1)

(define countsletter4 (create-counts 28 1))
( count-conditionals! org4 typ2-4 countsletter4)
(normalize-counts! countsletter4)

;;jaynes evidence
(display "Training on letter 1, 4, and get the evidence of letter 8")
(newline)
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1)
          (log-likelihood org8 typ1-8 countsletter4)))(newline)
(newline)
;; 2. Training on letter 1, 4, and get the log-likelihood of letter 16
;; jaynes evidence
(display "Training on letter 1, 4, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter1)
          (log-likelihood org16 typ1-16 countsletter4)))(newline)
(newline)
;; 3. Training on letter 1, 4, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 1, 4, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter1)
          (log-likelihood org9 typ2-9 countsletter4)))(newline) 
(newline)
;; 4. Training on letter 1, 4, and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 1, 4, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter1)
(log-likelihood org18 typ2-18 countsletter4)))(newline) 
(newline)

;; 5. Training on letter 1, 9, and get the log-likelihood of letter 8
(define countsletter9 (create-counts 28 1))
(count-conditionals! org9 typ2-9 countsletter9)
(normalize-counts! countsletter9)
;;jaynes evidence
(display "Training on letter 1, 9, and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1)
(log-likelihood org8 typ1-8 countsletter9)))(newline) 
(newline)

;; 6. Training on letter 1, 9, and get the log-likelihood of letter 16
;;jaynes evidence
(display "Training on letter 1, 9, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter1)
(log-likelihood org16 typ1-16 countsletter9)))(newline)
 (newline)                                             
;; 7. Training on letter 1, 9, and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 1, 9, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter1)
(log-likelihood org4 typ2-4 countsletter9)))(newline)
(newline)
;; 8. Training on letter 1, 9, and get the log-likelihood of letter 18
;;jaynes evidence                                            
(display "Training on letter 1, 9, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter1)
(log-likelihood org18 typ2-18 countsletter9)))(newline)
(newline)

;; 9. Training on letter 1, 18, and get the log-likelihood of letter 8
(define countsletter18 (create-counts 28 1))
(count-conditionals! org18 typ2-18 countsletter18)
(normalize-counts! countsletter18)
;;jaynes evidence
(display "Training on letter 1, 18, and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1)
(log-likelihood org8 typ1-8 countsletter18)))(newline)
(newline)
;; 10. Training on letter 1, 18, and get the log-likelihood of letter 16
;;jaynes evidence
(display "Training on letter 1, 18, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter1)
(log-likelihood org16 typ1-16 countsletter18)))(newline)
(newline)
;; 11. Training on letter 1, 18, and get the log-likelihood of letter 4
;;jaynes evidence                                      
(display "Training on letter 1, 18, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter1)
(log-likelihood org4 typ2-4 countsletter18)))(newline)
(newline)
;; 12. Training on letter 1, 18, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 1, 18, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter1)
(log-likelihood org9 typ2-9 countsletter18)))(newline) 
(newline)
;; 13. Training on letter 8, 4, and get the log-likelihood of letter 1
(define countsletter8 (create-counts 28 1))
(count-conditionals! org8 typ1-8 countsletter8)
(normalize-counts! countsletter8)
;;jaynes evidence
(display "Training on letter 8, 4, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8)
(log-likelihood org1 typ1-1 countsletter4)))(newline) 
(newline)
;; 14. Training on letter 8, 4, and get the log-likelihood of letter 16
;;jaynes evidence
(display "Training on letter 8, 4, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter8)
(log-likelihood org16 typ1-16 countsletter4)))(newline) 
(newline)
;; 15. Training on letter 8, 4, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 8, 4, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter8)
(log-likelihood org9 typ2-9 countsletter4)))(newline) 
(newline)
;; 16. Training on letter 8, 4, and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 8, 4, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter8)
(log-likelihood org18 typ2-18 countsletter4)))(newline) 
(newline)
;; 17. Training on letter 8, 9, and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 8, 9, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8)
(log-likelihood org1 typ1-1 countsletter9)))(newline) 
(newline)
;; 18. Training on letter 8, 9, and get the log-likelihood of letter 16
;;jaynes evidence
(display "Training on letter 8, 9, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter8)
(log-likelihood org16 typ1-16 countsletter9)))(newline) 
(newline)
;; 19. Training on letter 8, 9, and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 8, 9, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display(evidence (log-likelihood org4 typ2-4 countsletter8)
(log-likelihood org4 typ2-4 countsletter9)))(newline) 
(newline)
;; 20. Training on letter 8, 9, and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 8, 9, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter8)
(log-likelihood org18 typ2-18 countsletter9)))(newline) 
(newline)
;; 21. Training on letter 8, 18, and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8)
(log-likelihood org1 typ1-1 countsletter18)))(newline) 
(newline)
;; 22. Training on letter 8, 18, and get the log-likelihood of letter 16
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter8)
(log-likelihood org16 typ1-16 countsletter18)))(newline) 
(newline)
;; 23. Training on letter 8, 18, and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter8)
(log-likelihood org4 typ2-4 countsletter18)))(newline) 
(newline)
;; 24. Training on letter 8, 18, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter8)
(log-likelihood org9 typ2-9 countsletter18)))(newline) 
(newline)
;; 25. Training on letter 16, 4, and get the log-likelihood of letter 1
(define countsletter16 (create-counts 28 1))
(count-conditionals! org16 typ1-16 countsletter16)
(normalize-counts! countsletter16)
;;jaynes evidence
(display "Training on letter 16, 4, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter16)
(log-likelihood org1 typ1-1 countsletter4)))(newline) 
(newline)
;; 26. Training on letter 16, 4, and get the log-likelihood of letter 8
;;jaynes evidence
(display "Training on letter 16, 4, and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter16)
(log-likelihood org8 typ1-8 countsletter4)))(newline) 
(newline)
;; 27. Training on letter 16, 4, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 16, 4, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter16)
(log-likelihood org9 typ2-9 countsletter4)))(newline) 
(newline)
;; 28. Training on letter 16, 4, and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 16, 4, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter16)
(log-likelihood org18 typ2-18 countsletter4)))(newline) 
(newline)
;; 29. Training on letter 16, 9, and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 16, 9, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter16)
(log-likelihood org1 typ1-1 countsletter9)))(newline) 
(newline)
;; 30. Training on letter 16, 9, and get the log-likelihood of letter 8
;;jaynes evidence
(display "Training on letter 16, 9, and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter16)
(log-likelihood org8 typ1-8 countsletter9)))(newline) 
(newline)
;; 31. Training on letter 16, 9, and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 16, 9, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter16)
(log-likelihood org4 typ2-4 countsletter9)))(newline) 
(newline)
;; 32. Training on letter 16, 9, and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 16, 9, and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter16)
(log-likelihood org18 typ2-18 countsletter9)))(newline) 
(newline)
;; 33. Training on letter 16, 18, and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 16, 18, and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter16)
(log-likelihood org1 typ1-1 countsletter18)))(newline) 
(newline)
;; 34. Training on letter 8, 18, and get the log-likelihood of letter 8
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter16)
(log-likelihood org8 typ1-8 countsletter18)))(newline) 
(newline)
;; 35. Training on letter 8, 18, and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter16)
(log-likelihood org4 typ2-4 countsletter18)))(newline) 
(newline)
;; 36. Training on letter 8, 18, and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 8, 18, and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter16)
(log-likelihood org9 typ2-9 countsletter18)))(newline) 
(newline)
;; Training on two letters from each typist and calculate Jaynes's
;; evidence for the typist of each of the other one labeled letter.

;; 1. Training on letter 1, 8, 4, 9 and get the log-likelihood of letter 16
(define countsletter1-8 (create-counts 28 1))
(count-conditionals! org1 typ1-1 countsletter1-8)
(count-conditionals! org8 typ1-8 countsletter1-8)
(normalize-counts! countsletter1-8)
(define countsletter4-9 (create-counts 28 1))
(count-conditionals! org4 typ2-4 countsletter4-9)
(count-conditionals! org9 typ2-9 countsletter4-9)
(normalize-counts! countsletter4-9)
;;jaynes evidence
(display "Training on letter 1,8,4,9,and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter1-8)
          (log-likelihood org16 typ1-16 countsletter4-9)))(newline) 
(newline)
;; 2. Training on letter 1, 8, 4, 9 and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 1,8,4,9,and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter1-8)
(log-likelihood org18 typ2-18 countsletter4-9)))(newline) 
(newline)
;; 3. Training on letter 1, 8, 4, 18 and get the log-likelihood of letter 16
(define countsletter4-18 (create-counts 28 1))
(count-conditionals! org4 typ2-4 countsletter4-18)
(count-conditionals! org18 typ2-18 countsletter4-18)
(normalize-counts! countsletter4-18)
;;jaynes evidence
(display "Training on letter 1,8,4,18,and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence  (log-likelihood org16 typ1-16 countsletter1-8)
           (log-likelihood org16 typ1-16 countsletter4-18)))(newline) 
(newline)
;; 4. Training on letter 1, 8, 4, 18 and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 1,8,4,18,and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter1-8)
(log-likelihood org9 typ2-9 countsletter4-18)))(newline) 
(newline)
;; 5. Training on letter 1, 8, 9, 18 and get the log-likelihood of letter 16
(define countsletter9-18 (create-counts 28 1))
(count-conditionals! org9 typ2-9 countsletter9-18)
(count-conditionals! org18 typ2-18 countsletter9-18)
(normalize-counts! countsletter9-18)
;;jaynes evidence
(display "Training on letter 1,8,9,18,and get the evidence of letter 16")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org16 typ1-16 countsletter1-8)
          (log-likelihood org16 typ1-16 countsletter9-18)))(newline) 
(newline)
;; 6. Training on letter 1, 8, 9, 18 and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 1,8,9,18,and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter1-8)
(log-likelihood org4 typ2-4 countsletter9-18)))(newline) 
(newline)
;; 7. Training on letter 1, 16, 4, 9 and get the log-likelihood of letter 8
(define countsletter1-16 (create-counts 28 1))
(count-conditionals! org1 typ1-1 countsletter1-16)
(count-conditionals! org16 typ1-16 countsletter1-16)
(normalize-counts! countsletter1-16)
;;jaynes evidence
(display "Training on letter 1,16,4,9,and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1-16)
(log-likelihood org8 typ1-8 countsletter4-9)))(newline) 
(newline)
;; 8. Training on letter 1, 16, 4, 9 and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 1,16,4,9,and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter1-16)
(log-likelihood org18 typ2-18 countsletter4-9)))(newline) 
(newline)
;; 9. Training on letter 1, 16, 4, 18 and get the log-likelihood of letter 8
;;jaynes evidence
(display "Training on letter 1,16,4,18,and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1-16)
(log-likelihood org8 typ1-8 countsletter4-18)))(newline) 
(newline)
;; 10. Training on letter 1, 16, 4, 18 and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 1,16,4,18,and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter1-16)
(log-likelihood org9 typ2-9 countsletter4-18)))(newline) 
(newline)
;; 11. Training on letter 1, 16, 9, 18 and get the log-likelihood of letter 8
;;jaynes evidence
(display "Training on letter 1,16,9,18,and get the evidence of letter 8")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org8 typ1-8 countsletter1-16)
(log-likelihood org8 typ1-8 countsletter9-18)))(newline) 
(newline)
;; 12. Training on letter 1, 16, 9, 18 and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 1,16,9,18,and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter1-16)
(log-likelihood org4 typ2-4 countsletter9-18)))(newline) 

;; 13. Training on letter 8, 16, 4, 9 and get the log-likelihood of letter 1
(define countsletter8-16 (create-counts 28 1))
(count-conditionals! org8 typ1-8 countsletter8-16)
(count-conditionals! org16 typ1-16 countsletter8-16)
(normalize-counts! countsletter8-16)
;;jaynes evidence
(display "Training on letter 8,16,4,9,and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8-16)
(log-likelihood org1 typ1-1 countsletter4-9)))(newline) 
(newline)
;; 14. Training on letter 8, 16, 4, 9 and get the log-likelihood of letter 18
;;jaynes evidence
(display "Training on letter 8,16,4,9,and get the evidence of letter 18")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org18 typ2-18 countsletter8-16)
(log-likelihood org18 typ2-18 countsletter4-9)))(newline) 
(newline)
;; 15. Training on letter 8, 16, 4, 18 and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 8,16,4,18,and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8-16)
(log-likelihood org1 typ1-1 countsletter4-18)))(newline) 
(newline)
;; 16. Training on letter 8, 16, 4, 18 and get the log-likelihood of letter 9
;;jaynes evidence
(display "Training on letter 8,16,4,18,and get the evidence of letter 9")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org9 typ2-9 countsletter8-16)
(log-likelihood org9 typ2-9 countsletter4-18)))(newline) 
(newline)
;; 17. Training on letter 8, 16, 9, 18 and get the log-likelihood of letter 1
;;jaynes evidence
(display "Training on letter 8,16,9,18,and get the evidence of letter 1")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org1 typ1-1 countsletter8-16)
(log-likelihood org1 typ1-1 countsletter9-18)))(newline) 
(newline)
;; 18. Training on letter 8, 16, 9, 18 and get the log-likelihood of letter 4
;;jaynes evidence
(display "Training on letter 8,16,9,18,and get the evidence of letter 4")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org4 typ2-4 countsletter8-16)
(log-likelihood org4 typ2-4 countsletter9-18)))(newline) 
(newline)
;; Training on all letters from each typist and calculate Jaynes's
;; evidence for the typist of each of the unknown letter.

;; 1. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 3
(define countslettertyp1 (create-counts 28 1))
(count-conditionals! org1 typ1-1 countslettertyp1)
(count-conditionals! org8 typ1-8 countslettertyp1)
(count-conditionals! org16 typ1-16 countslettertyp1)
(normalize-counts! countslettertyp1)

(define countslettertyp2 (create-counts 28 1))
(count-conditionals! org4 typ2-4 countslettertyp2)
(count-conditionals! org9 typ2-9 countslettertyp2)
(count-conditionals! org18 typ2-18 countslettertyp2)
(normalize-counts! countslettertyp2)

;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 3")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org3 unknown-3 countslettertyp1)
          (log-likelihood org3 unknown-3 countslettertyp2)))(newline) 
(newline)
;; 2. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 7
;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 7")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org7 unknown-7 countslettertyp1)
(log-likelihood org7 unknown-7 countslettertyp2)))(newline) 
(newline)
;; 3. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 10
;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 10")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org10 unknown-10 countslettertyp1)
(log-likelihood org10 unknown-10 countslettertyp2)))(newline) 
(newline)
;; 4. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 11
;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 11")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org11 unknown-11 countslettertyp1)
(log-likelihood org11 unknown-11 countslettertyp2)))(newline) 
(newline)
;; 5. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 15
;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 15")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org15 unknown-15 countslettertyp1)
(log-likelihood org15 unknown-15 countslettertyp2)))(newline) 
(newline)
;; 6. Training on letter 1, 8, 16, 4, 9 ,18 and get the log-likelihood of letter
;; 22
;;jaynes evidence
(display "Training on all labeled letters,and get the evidence of letter 22")
(newline)                                 
(display "Jaynes evidence for the typiest is typiest 1: ")
(display (evidence (log-likelihood org22 unknown-22 countslettertyp1)
(log-likelihood org22 unknown-22 countslettertyp2)))(newline) 
