;; Lab: Propositional Logic
;; CSC 261 
;;
;; File
;;   problems.scm
;;
;; Summary
;;   Knowledge bases of Unicorns, Portia's Caskets, and Knights, Knaves, and
;;   Werewolves
;;   Use tt-entails? to prove the propositional logic 
;;
;; Provides
;;   [None]


(load "logic.scm")
(load "enumeration.scm")

;; Unicorns!
;; The atomic knowledge-base components are 'Mythical - the unicorn is mythical,
;; 'Mortal - the unicorn is mortal, 'Magical - the unicorn is magic and
;; 'Horned - the unicorn is horned
(define unicorn-kb (list 'and
                         (list '=>
                               'Mythical
                               (list 'not 'Mortal))
                         (list 'and
                               (list '=>
                                     (list 'not 'Mythical)
                                     (list 'and 'Mortal 'Mammal))
                               (list 'and (list '=>
                                                (list 'or
                                                      (list 'not 'Mortal)
                                                      'Mammal)
                                                'Horned)
                                     (list '=> 'Horned 'Magical)))))


;;Show whether the unicorn is mythical, magical, or horned
(display "Unicorns!")
(display "\nIs the unicorn mythical? ")
(display (tt-entails? unicorn-kb 'Mythical))
(display "\nIs the unicorn magical? ")
(display (tt-entails? unicorn-kb 'Magical))
(display "\nIs the unicorn horned? ")
(display (tt-entails? unicorn-kb 'Horned))
(display "\nBased on the results, we know the unicorn is both magical and
horned.")


;; Portia's Caskets
;; I divide the knowledge base in two parts: the first is extracted from
;; inscription of Gold, Silver, and Lead; the second is combination of
;; both inscriptions and the rule that at most a statement was true

;; The atomic knowledge-base components are 'Goldistrue - Gold is true,
;; 'Gold - the portrait is in the gold casket; 'Silveristrue - Silver is
;; ture, 'Silver - the portrait is in the silver casket; 'Leadistrue -
;; Lead is true, and 'Lead - the portrait is in the lead casket.

;;inscriptions
(define inscriptions (list 'and (list '<=> 'Goldistrue 'Gold)
                      (list 'and (list '<=> 'Silveristrue (list 'not 'Silver))
                            (list '<=> 'Leadistrue (list 'not 'Gold)))))

;;portia-kb
(define portia-kb (list 'and inscriptions
                      (list 'or (list 'and 'Goldistrue
                                 (list 'not (list 'or 'Silveristrue
                                                  'Leadistrue)))
                       (list 'or (list 'and 'Silveristrue
                                       (list 'not (list 'or 'Goldistrue
                                                        'Leadistrue)))
                             (list 'or (list 'and 'Leadistrue
                                         (list 'not (list 'or 'Goldistrue
                                                          'Silveristrue)))
                                   (list 'not (list 'or 'Goldistrue
                                                    (list 'or 'Silveristrue
                                                          'Leadistrue))))))))
;; Show which casket should the suitor should choose and which he should
;; not choose.
(display "\n\nPortia’s Caskets")
(display "\nIs the portrait in the gold casket?")
;(tt-entails? portia-kb 'Gold)
(display "\nIs the portrait in the silver casket?")
;(display (tt-entails? portia-kb 'Silver))
(display "\nIs the portrait in the lead casket?")
;(display (tt-entails? portia-kb 'Lead))
(display "\nIs the portrait not in the gold casket? ")
;(display (tt-entails? portia-kb (list 'or 'Silver 'Lead)))
(display "\nIs the portrait not in the silver casket? ")
;(display (tt-entails? portia-kb (list 'or 'Gold 'Lead)))
(display "\nIs the portrait not in the lead casket? ")
;(display (tt-entails? portia-kb (list 'or 'Gold 'Silver)))
(display "\nBased on the results, we know that the suitor should choose")
;(display "the silver casket and shoud not choose the gold and the lead one")



;; Knights, Knaves, and Werewolves
;; I divide the knowledge base in three parts: the first is extracted from
;; statement of C; the second is the combination of all statements; the third
;; is combination of statements and the rule that exactly one of them is a
;; werewolf
;; The atomic knowledge-base components are 'A-knight - A is a knight,
;; B-knight - B is a knight, C-knight - C is a knight, A-werewolf-
;; A is a werewolf, B-werewolf - B is a werewolf, and C-werewolf - C
;; is a werewolf.

;; C-statement
(define C-statement (list 'or (list 'and 'A-knight
                                   (list 'not (list 'or
                                                    'B-knight
                                                    'C-knight)))
                         (list 'or (list 'and 'B-knight
                                         (list 'not (list 'or
                                                          'A-knight
                                                          'C-knight)))
                               (list 'or (list 'and 'C-knight
                                           (list 'not (list 'or
                                                            'A-knight
                                                            'B-knight)))
                                     (list 'not (list 'or 'A-knight
                                                      (list 'or 'B-knight
                                                            'C-knight)))))))

;; statemetns
(define statements
  (list 'and (list '<=> 'A-knight 'A-werewolf)
        (list 'and (list '<=> 'B-knight 'B-werewolf)
              (list '<=> 'C-knight C-statement))))


;; liars-kb
(define liars-kb (list 'and statements
                           (list 'or (list 'and 'A-werewolf
                                 (list 'not (list 'or
                                                  'B-werewolf
                                                  'C-werewolf)))
                       (list 'or (list 'and 'B-werewolf
                                       (list 'not (list 'or
                                                        'A-werewolf
                                                        'C-werewolf)))
                           
                             (list 'and 'C-werewolf
                                   (list 'not (list 'or
                                                    'A-werewolf
                                                    'B-werewolf)))))))


;; classification of A,B, andC as either knight or knave and werewolf or
;; human.

(display "\n\nKnights, Knaves, and Werewolves ")
(display "\nIs A a Knight? ")
(tt-entails? liars-kb 'A-knight)
(display "\nIs B a Knight? ")
(display (tt-entails? liars-kb 'B-knight))
(display "\nIs C a Knight? ")
(display (tt-entails? liars-kb 'C-knight))
(display "\nIs A a Knave? ")
(display (tt-entails? liars-kb (list 'not 'A-knight)))
(display "\nIs B a Knave? ")
(display (tt-entails? liars-kb (list 'not 'B-knight)))
(display "\nIs C a Knave? ")
(display (tt-entails? liars-kb (list 'not 'C-knight)))
(display"\nIs A a werewolf? ")
(display (tt-entails? liars-kb 'A-werewolf))
(display "\nIs B a werewolf? ")
(display (tt-entails? liars-kb 'B-werewolf))
(display "\nIs C a werewolf? ")
(display (tt-entails? liars-kb 'C-werewolf))
(display"\nIs A a human? ")
(display (tt-entails? liars-kb (list 'not 'A-werewolf)))
(display "\nIs B a human? ")
(display (tt-entails? liars-kb (list 'not 'B-werewolf)))
(display "\nIs C a human? ")
(display (tt-entails? liars-kb (list 'not 'C-werewolf)))

(display "\nBased on the results, we know that C is a werewolf and both A
and B are humans; C is a knight and both A and B are knaves")




