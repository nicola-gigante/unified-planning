(define (problem roverprob4132)
(:domain rover)
(:objects
 rover0 rover1 rover2 rover3 - rover
 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 - waypoint
 rover0store rover1store rover2store rover3store - store
 camera0 camera1 camera2 camera3 camera4 - camera
 colour high_res low_res - mode
 general - lander
 objective0 objective1 objective2 - objective
)
(:shared-data
  (communicated_soil_data ?w - waypoint)
  (communicated_rock_data ?w - waypoint)
  (communicated_image_data ?o - objective ?m - mode)
  (at_soil_sample ?w - waypoint)
  (at_rock_sample ?w - waypoint) -
(either rover0 rover1 rover2)
)
(:init (myRover rover3)
 (equipped_for_soil_analysis rover3)
 (not (equipped_for_rock_analysis rover3))
 (equipped_for_imaging rover3)
 (empty rover0store)
 (empty rover1store)
 (empty rover2store)
 (empty rover3store)
 (not (full rover0store))
 (not (full rover1store))
 (not (full rover2store))
 (not (full rover3store))
 (not (can_traverse rover3 waypoint0 waypoint0))
 (not (can_traverse rover3 waypoint0 waypoint1))
 (can_traverse rover3 waypoint0 waypoint2)
 (can_traverse rover3 waypoint0 waypoint3)
 (not (can_traverse rover3 waypoint0 waypoint4))
 (can_traverse rover3 waypoint0 waypoint5)
 (not (can_traverse rover3 waypoint0 waypoint6))
 (not (can_traverse rover3 waypoint1 waypoint0))
 (not (can_traverse rover3 waypoint1 waypoint1))
 (can_traverse rover3 waypoint1 waypoint2)
 (not (can_traverse rover3 waypoint1 waypoint3))
 (can_traverse rover3 waypoint1 waypoint4)
 (not (can_traverse rover3 waypoint1 waypoint5))
 (not (can_traverse rover3 waypoint1 waypoint6))
 (can_traverse rover3 waypoint2 waypoint0)
 (can_traverse rover3 waypoint2 waypoint1)
 (not (can_traverse rover3 waypoint2 waypoint2))
 (not (can_traverse rover3 waypoint2 waypoint3))
 (not (can_traverse rover3 waypoint2 waypoint4))
 (not (can_traverse rover3 waypoint2 waypoint5))
 (can_traverse rover3 waypoint2 waypoint6)
 (can_traverse rover3 waypoint3 waypoint0)
 (not (can_traverse rover3 waypoint3 waypoint1))
 (not (can_traverse rover3 waypoint3 waypoint2))
 (not (can_traverse rover3 waypoint3 waypoint3))
 (not (can_traverse rover3 waypoint3 waypoint4))
 (not (can_traverse rover3 waypoint3 waypoint5))
 (not (can_traverse rover3 waypoint3 waypoint6))
 (not (can_traverse rover3 waypoint4 waypoint0))
 (can_traverse rover3 waypoint4 waypoint1)
 (not (can_traverse rover3 waypoint4 waypoint2))
 (not (can_traverse rover3 waypoint4 waypoint3))
 (not (can_traverse rover3 waypoint4 waypoint4))
 (not (can_traverse rover3 waypoint4 waypoint5))
 (not (can_traverse rover3 waypoint4 waypoint6))
 (can_traverse rover3 waypoint5 waypoint0)
 (not (can_traverse rover3 waypoint5 waypoint1))
 (not (can_traverse rover3 waypoint5 waypoint2))
 (not (can_traverse rover3 waypoint5 waypoint3))
 (not (can_traverse rover3 waypoint5 waypoint4))
 (not (can_traverse rover3 waypoint5 waypoint5))
 (not (can_traverse rover3 waypoint5 waypoint6))
 (not (can_traverse rover3 waypoint6 waypoint0))
 (not (can_traverse rover3 waypoint6 waypoint1))
 (can_traverse rover3 waypoint6 waypoint2)
 (not (can_traverse rover3 waypoint6 waypoint3))
 (not (can_traverse rover3 waypoint6 waypoint4))
 (not (can_traverse rover3 waypoint6 waypoint5))
 (not (can_traverse rover3 waypoint6 waypoint6))
 (not (have_rock_analysis rover3 waypoint0))
 (not (have_rock_analysis rover3 waypoint1))
 (not (have_rock_analysis rover3 waypoint2))
 (not (have_rock_analysis rover3 waypoint3))
 (not (have_rock_analysis rover3 waypoint4))
 (not (have_rock_analysis rover3 waypoint5))
 (not (have_rock_analysis rover3 waypoint6))
 (not (have_soil_analysis rover3 waypoint0))
 (not (have_soil_analysis rover3 waypoint1))
 (not (have_soil_analysis rover3 waypoint2))
 (not (have_soil_analysis rover3 waypoint3))
 (not (have_soil_analysis rover3 waypoint4))
 (not (have_soil_analysis rover3 waypoint5))
 (not (have_soil_analysis rover3 waypoint6))
 (not (visible waypoint0 waypoint0))
 (visible waypoint0 waypoint1)
 (visible waypoint0 waypoint2)
 (visible waypoint0 waypoint3)
 (not (visible waypoint0 waypoint4))
 (visible waypoint0 waypoint5)
 (visible waypoint0 waypoint6)
 (visible waypoint1 waypoint0)
 (not (visible waypoint1 waypoint1))
 (visible waypoint1 waypoint2)
 (visible waypoint1 waypoint3)
 (visible waypoint1 waypoint4)
 (visible waypoint1 waypoint5)
 (visible waypoint1 waypoint6)
 (visible waypoint2 waypoint0)
 (visible waypoint2 waypoint1)
 (not (visible waypoint2 waypoint2))
 (not (visible waypoint2 waypoint3))
 (not (visible waypoint2 waypoint4))
 (visible waypoint2 waypoint5)
 (visible waypoint2 waypoint6)
 (visible waypoint3 waypoint0)
 (visible waypoint3 waypoint1)
 (not (visible waypoint3 waypoint2))
 (not (visible waypoint3 waypoint3))
 (visible waypoint3 waypoint4)
 (not (visible waypoint3 waypoint5))
 (visible waypoint3 waypoint6)
 (not (visible waypoint4 waypoint0))
 (visible waypoint4 waypoint1)
 (not (visible waypoint4 waypoint2))
 (visible waypoint4 waypoint3)
 (not (visible waypoint4 waypoint4))
 (not (visible waypoint4 waypoint5))
 (visible waypoint4 waypoint6)
 (visible waypoint5 waypoint0)
 (visible waypoint5 waypoint1)
 (visible waypoint5 waypoint2)
 (not (visible waypoint5 waypoint3))
 (not (visible waypoint5 waypoint4))
 (not (visible waypoint5 waypoint5))
 (visible waypoint5 waypoint6)
 (visible waypoint6 waypoint0)
 (visible waypoint6 waypoint1)
 (visible waypoint6 waypoint2)
 (visible waypoint6 waypoint3)
 (visible waypoint6 waypoint4)
 (visible waypoint6 waypoint5)
 (not (visible waypoint6 waypoint6))
 (not (communicated_soil_data waypoint0))
 (not (communicated_soil_data waypoint1))
 (not (communicated_soil_data waypoint2))
 (not (communicated_soil_data waypoint3))
 (not (communicated_soil_data waypoint4))
 (not (communicated_soil_data waypoint5))
 (not (communicated_soil_data waypoint6))
 (not (communicated_rock_data waypoint0))
 (not (communicated_rock_data waypoint1))
 (not (communicated_rock_data waypoint2))
 (not (communicated_rock_data waypoint3))
 (not (communicated_rock_data waypoint4))
 (not (communicated_rock_data waypoint5))
 (not (communicated_rock_data waypoint6))
 (at_soil_sample waypoint0)
 (at_soil_sample waypoint1)
 (not (at_soil_sample waypoint2))
 (not (at_soil_sample waypoint3))
 (at_soil_sample waypoint4)
 (at_soil_sample waypoint5)
 (at_soil_sample waypoint6)
 (at_rock_sample waypoint0)
 (at_rock_sample waypoint1)
 (not (at_rock_sample waypoint2))
 (at_rock_sample waypoint3)
 (not (at_rock_sample waypoint4))
 (at_rock_sample waypoint5)
 (at_rock_sample waypoint6)
 (not (calibrated camera0 rover3))
 (not (calibrated camera1 rover3))
 (not (calibrated camera2 rover3))
 (not (calibrated camera3 rover3))
 (not (calibrated camera4 rover3))
 (supports camera0 colour)
 (not (supports camera0 high_res))
 (supports camera0 low_res)
 (supports camera1 colour)
 (not (supports camera1 high_res))
 (not (supports camera1 low_res))
 (not (supports camera2 colour))
 (not (supports camera2 high_res))
 (supports camera2 low_res)
 (supports camera3 colour)
 (supports camera3 high_res)
 (supports camera3 low_res)
 (supports camera4 colour)
 (not (supports camera4 high_res))
 (supports camera4 low_res)
 (not (have_image rover3 objective0 colour))
 (not (have_image rover3 objective0 high_res))
 (not (have_image rover3 objective0 low_res))
 (not (have_image rover3 objective1 colour))
 (not (have_image rover3 objective1 high_res))
 (not (have_image rover3 objective1 low_res))
 (not (have_image rover3 objective2 colour))
 (not (have_image rover3 objective2 high_res))
 (not (have_image rover3 objective2 low_res))
 (not (communicated_image_data objective0 colour))
 (not (communicated_image_data objective0 high_res))
 (not (communicated_image_data objective0 low_res))
 (not (communicated_image_data objective1 colour))
 (not (communicated_image_data objective1 high_res))
 (not (communicated_image_data objective1 low_res))
 (not (communicated_image_data objective2 colour))
 (not (communicated_image_data objective2 high_res))
 (not (communicated_image_data objective2 low_res))
 (visible_from objective0 waypoint0)
 (visible_from objective0 waypoint1)
 (visible_from objective0 waypoint2)
 (not (visible_from objective0 waypoint3))
 (not (visible_from objective0 waypoint4))
 (not (visible_from objective0 waypoint5))
 (not (visible_from objective0 waypoint6))
 (visible_from objective1 waypoint0)
 (visible_from objective1 waypoint1)
 (visible_from objective1 waypoint2)
 (visible_from objective1 waypoint3)
 (visible_from objective1 waypoint4)
 (visible_from objective1 waypoint5)
 (not (visible_from objective1 waypoint6))
 (visible_from objective2 waypoint0)
 (visible_from objective2 waypoint1)
 (visible_from objective2 waypoint2)
 (visible_from objective2 waypoint3)
 (visible_from objective2 waypoint4)
 (visible_from objective2 waypoint5)
 (visible_from objective2 waypoint6)
 (= (at rover3) waypoint2)
 (= (at_lander general) waypoint4)
 (= (store_of rover0store) rover0)
 (= (store_of rover1store) rover1)
 (= (store_of rover2store) rover2)
 (= (store_of rover3store) rover3)
 (= (calibration_target camera0) objective2)
 (= (calibration_target camera1) objective2)
 (= (calibration_target camera2) objective0)
 (= (calibration_target camera3) objective0)
 (= (calibration_target camera4) objective1)
 (= (on_board camera0) rover3)
 (= (on_board camera1) rover0)
 (= (on_board camera2) rover0)
 (= (on_board camera3) rover2)
 (= (on_board camera4) rover1)
)
(:global-goal (and
 (communicated_soil_data waypoint6)
 (communicated_soil_data waypoint4)
 (communicated_soil_data waypoint0)
 (communicated_rock_data waypoint6)
 (communicated_rock_data waypoint0)
 (communicated_rock_data waypoint3)
 (communicated_image_data objective2 low_res)
 (communicated_image_data objective2 colour)
))
)
