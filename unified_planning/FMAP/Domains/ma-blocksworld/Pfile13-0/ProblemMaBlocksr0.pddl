(define (problem BLOCKS-13-0)
(:domain ma-blocksworld)
(:objects
 r0 r1 r2 r3 - robot
 i m g h l a c d e k f b j - block
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
 (clear i)
 (= (on i) g)
 (not (ontable i))
 (clear m)
 (ontable m)
 (= (on m) nob)
 (not (clear g))
 (ontable g)
 (= (on g) nob)
 (not (clear h))
 (= (on h) l)
 (not (ontable h))
 (not (clear l))
 (= (on l) k)
 (not (ontable l))
 (not (clear a))
 (= (on a) e)
 (not (ontable a))
 (not (clear c))
 (= (on c) j)
 (not (ontable c))
 (not (clear d))
 (= (on d) c)
 (not (ontable d))
 (not (clear e))
 (= (on e) h)
 (not (ontable e))
 (not (clear k))
 (ontable k)
 (= (on k) nob)
 (not (clear f))
 (= (on f) d)
 (not (ontable f))
 (clear b)
 (= (on b) f)
 (not (ontable b))
 (not (clear j))
 (= (on j) a)
 (not (ontable j))
)
(:global-goal (and
 (= (on g) i)
 (= (on i) c)
 (= (on c) d)
 (= (on d) f)
 (= (on f) a)
 (= (on a) m)
 (= (on m) h)
 (= (on h) e)
 (= (on e) l)
 (= (on l) j)
 (= (on j) b)
 (= (on b) k)
)))
