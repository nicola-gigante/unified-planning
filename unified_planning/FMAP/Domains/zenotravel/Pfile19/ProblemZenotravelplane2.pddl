(define (problem ZTRAVEL-5-25)
(:domain zeno-travel)
(:objects
 plane1 plane2 plane3 plane4 plane5 - aircraft
 person1 person2 person3 person4 person5 person6 person7 person8 person9 person10 person11 person12 person13 person14 person15 person16 person17 person18 person19 person20 person21 person22 person23 person24 person25 - person
 city0 city1 city2 city3 city4 city5 city6 city7 city8 city9 city10 city11 city12 city13 city14 city15 city16 city17 city18 city19 - city
 fl0 fl1 fl2 fl3 fl4 fl5 fl6 - flevel
)
(:shared-data
  ((at ?a - aircraft) - city)
  ((in ?p - person) - (either city aircraft)) - 
(either plane1 plane3 plane4 plane5)
)
(:init
 (myAgent plane2)
 (= (at plane1) city0)
 (= (at plane2) city1)
 (= (at plane3) city16)
 (= (at plane4) city10)
 (= (at plane5) city1)
 (= (fuel-level plane2) fl1)
 (= (in person1) city19)
 (= (in person2) city3)
 (= (in person3) city6)
 (= (in person4) city16)
 (= (in person5) city13)
 (= (in person6) city6)
 (= (in person7) city0)
 (= (in person8) city3)
 (= (in person9) city13)
 (= (in person10) city16)
 (= (in person11) city2)
 (= (in person12) city6)
 (= (in person13) city8)
 (= (in person14) city0)
 (= (in person15) city8)
 (= (in person16) city19)
 (= (in person17) city9)
 (= (in person18) city0)
 (= (in person19) city1)
 (= (in person20) city12)
 (= (in person21) city8)
 (= (in person22) city15)
 (= (in person23) city4)
 (= (in person24) city6)
 (= (in person25) city17)
 (= (next fl0) fl1)
 (= (next fl1) fl2)
 (= (next fl2) fl3)
 (= (next fl3) fl4)
 (= (next fl4) fl5)
 (= (next fl5) fl6)
)
(:global-goal (and
 (= (at plane1) city11)
 (= (at plane2) city8)
 (= (in person1) city10)
 (= (in person2) city1)
 (= (in person3) city13)
 (= (in person4) city9)
 (= (in person5) city0)
 (= (in person6) city16)
 (= (in person7) city0)
 (= (in person8) city0)
 (= (in person9) city17)
 (= (in person10) city13)
 (= (in person11) city13)
 (= (in person12) city17)
 (= (in person13) city3)
 (= (in person14) city0)
 (= (in person15) city13)
 (= (in person16) city19)
 (= (in person17) city0)
 (= (in person18) city4)
 (= (in person19) city17)
 (= (in person20) city14)
 (= (in person21) city17)
 (= (in person22) city4)
 (= (in person23) city12)
 (= (in person24) city13)
 (= (in person25) city2)
)))
