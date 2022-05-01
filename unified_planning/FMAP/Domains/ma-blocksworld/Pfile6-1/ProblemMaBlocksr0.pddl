(define (problem BLOCKS-6-1)
(:domain ma-blocksworld)
(:objects
 r0 r1 r2 r3 - robot
 f d c e b a - block
)
(:shared-data
  ((on ?b - block) - block)
  (ontable ?b - block)
  (clear ?b - block)
  ((holding ?r - robot) - block) - 
(either r1 r2 r3)
)
(:init
 (myAgent r0)
 (= (holding r0) nob)
 (= (holding r1) nob)
 (= (holding r2) nob)
 (= (holding r3) nob)
 (not (clear f))
 (ontable f)
 (= (on f) nob)
 (clear d)
 (ontable d)
 (= (on d) nob)
 (clear c)
 (ontable c)
 (= (on c) nob)
 (clear e)
 (ontable e)
 (= (on e) nob)
 (clear b)
 (ontable b)
 (= (on b) nob)
 (clear a)
 (= (on a) f)
 (not (ontable a))
)
(:global-goal (and
 (= (on e) f)
 (= (on f) c)
 (= (on c) b)
 (= (on b) a)
 (= (on a) d)
)))
