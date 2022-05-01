(define (problem depotprob5451)
(:domain depot)
(:objects
 depot0 - depot
 distributor0 distributor1 - distributor
 truck0 truck1 - truck
 crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
 pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet
 hoist0 hoist1 hoist2 - hoist
)
(:shared-data
  (clear ?x - (either surface hoist))
  ((at ?t - truck) - place)
  ((pos ?c - crate) - (either place truck))
  ((on ?c - crate) - (either surface hoist truck)) - 
(either depot0 distributor0 distributor1 truck0)
)
(:init
 (myAgent truck1)
 (= (pos crate0) distributor1)
 (not (clear crate0))
 (= (on crate0) pallet2)
 (= (pos crate1) depot0)
 (not (clear crate1))
 (= (on crate1) pallet0)
 (= (pos crate2) depot0)
 (clear crate2)
 (= (on crate2) crate1)
 (= (pos crate3) distributor0)
 (not (clear crate3))
 (= (on crate3) pallet1)
 (= (pos crate4) distributor1)
 (not (clear crate4))
 (= (on crate4) crate0)
 (= (pos crate5) distributor1)
 (not (clear crate5))
 (= (on crate5) pallet3)
 (= (pos crate6) distributor0)
 (not (clear crate6))
 (= (on crate6) crate3)
 (= (pos crate7) distributor0)
 (not (clear crate7))
 (= (on crate7) crate6)
 (= (pos crate8) depot0)
 (clear crate8)
 (= (on crate8) pallet5)
 (= (pos crate9) distributor0)
 (not (clear crate9))
 (= (on crate9) crate7)
 (= (pos crate10) distributor1)
 (clear crate10)
 (= (on crate10) crate5)
 (= (pos crate11) distributor0)
 (not (clear crate11))
 (= (on crate11) pallet4)
 (= (pos crate12) distributor0)
 (clear crate12)
 (= (on crate12) crate11)
 (= (pos crate13) distributor1)
 (clear crate13)
 (= (on crate13) crate4)
 (= (pos crate14) distributor0)
 (clear crate14)
 (= (on crate14) crate9)
 (= (at truck0) distributor0)
 (= (at truck1) distributor0)
 (= (located hoist0) depot0)
 (clear hoist0)
 (= (located hoist1) distributor0)
 (clear hoist1)
 (= (located hoist2) distributor1)
 (clear hoist2)
 (= (placed pallet0) depot0)
 (not (clear pallet0))
 (= (placed pallet1) distributor0)
 (not (clear pallet1))
 (= (placed pallet2) distributor1)
 (not (clear pallet2))
 (= (placed pallet3) distributor1)
 (not (clear pallet3))
 (= (placed pallet4) distributor0)
 (not (clear pallet4))
 (= (placed pallet5) depot0)
 (not (clear pallet5))
)
(:global-goal (and
 (= (on crate0) crate5)
 (= (on crate1) crate2)
 (= (on crate2) crate10)
 (= (on crate3) pallet0)
 (= (on crate4) crate6)
 (= (on crate5) pallet5)
 (= (on crate6) pallet4)
 (= (on crate9) crate1)
 (= (on crate10) pallet2)
 (= (on crate11) pallet1)
 (= (on crate12) crate14)
 (= (on crate13) crate3)
 (= (on crate14) pallet3)
))
)
