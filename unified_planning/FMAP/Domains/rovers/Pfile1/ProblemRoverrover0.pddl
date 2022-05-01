(define (problem roverprob1234)
(:domain rover)
(:objects
 rover0 - rover
 waypoint0 waypoint1 waypoint2 waypoint3 - waypoint
 rover0store - store
 camera0 - camera
 colour high_res low_res - mode
 general - lander
 objective0 objective1 - objective
)
(:init (myRover rover0)
 (equipped_for_soil_analysis rover0)
 (equipped_for_rock_analysis rover0)
 (equipped_for_imaging rover0)
 (empty rover0store)
 (not (full rover0store))
 (not (can_traverse rover0 waypoint0 waypoint0))
 (not (can_traverse rover0 waypoint0 waypoint1))
 (not (can_traverse rover0 waypoint0 waypoint2))
 (can_traverse rover0 waypoint0 waypoint3)
 (not (can_traverse rover0 waypoint1 waypoint0))
 (not (can_traverse rover0 waypoint1 waypoint1))
 (can_traverse rover0 waypoint1 waypoint2)
 (can_traverse rover0 waypoint1 waypoint3)
 (not (can_traverse rover0 waypoint2 waypoint0))
 (can_traverse rover0 waypoint2 waypoint1)
 (not (can_traverse rover0 waypoint2 waypoint2))
 (not (can_traverse rover0 waypoint2 waypoint3))
 (can_traverse rover0 waypoint3 waypoint0)
 (can_traverse rover0 waypoint3 waypoint1)
 (not (can_traverse rover0 waypoint3 waypoint2))
 (not (can_traverse rover0 waypoint3 waypoint3))
 (not (have_rock_analysis rover0 waypoint0))
 (not (have_rock_analysis rover0 waypoint1))
 (not (have_rock_analysis rover0 waypoint2))
 (not (have_rock_analysis rover0 waypoint3))
 (not (have_soil_analysis rover0 waypoint0))
 (not (have_soil_analysis rover0 waypoint1))
 (not (have_soil_analysis rover0 waypoint2))
 (not (have_soil_analysis rover0 waypoint3))
 (not (visible waypoint0 waypoint0))
 (visible waypoint0 waypoint1)
 (visible waypoint0 waypoint2)
 (visible waypoint0 waypoint3)
 (visible waypoint1 waypoint0)
 (not (visible waypoint1 waypoint1))
 (visible waypoint1 waypoint2)
 (visible waypoint1 waypoint3)
 (visible waypoint2 waypoint0)
 (visible waypoint2 waypoint1)
 (not (visible waypoint2 waypoint2))
 (visible waypoint2 waypoint3)
 (visible waypoint3 waypoint0)
 (visible waypoint3 waypoint1)
 (visible waypoint3 waypoint2)
 (not (visible waypoint3 waypoint3))
 (not (communicated_soil_data waypoint0))
 (not (communicated_soil_data waypoint1))
 (not (communicated_soil_data waypoint2))
 (not (communicated_soil_data waypoint3))
 (not (communicated_rock_data waypoint0))
 (not (communicated_rock_data waypoint1))
 (not (communicated_rock_data waypoint2))
 (not (communicated_rock_data waypoint3))
 (at_soil_sample waypoint0)
 (not (at_soil_sample waypoint1))
 (at_soil_sample waypoint2)
 (at_soil_sample waypoint3)
 (not (at_rock_sample waypoint0))
 (at_rock_sample waypoint1)
 (at_rock_sample waypoint2)
 (at_rock_sample waypoint3)
 (not (calibrated camera0 rover0))
 (supports camera0 colour)
 (supports camera0 high_res)
 (not (supports camera0 low_res))
 (not (have_image rover0 objective0 colour))
 (not (have_image rover0 objective0 high_res))
 (not (have_image rover0 objective0 low_res))
 (not (have_image rover0 objective1 colour))
 (not (have_image rover0 objective1 high_res))
 (not (have_image rover0 objective1 low_res))
 (not (communicated_image_data objective0 colour))
 (not (communicated_image_data objective0 high_res))
 (not (communicated_image_data objective0 low_res))
 (not (communicated_image_data objective1 colour))
 (not (communicated_image_data objective1 high_res))
 (not (communicated_image_data objective1 low_res))
 (visible_from objective0 waypoint0)
 (visible_from objective0 waypoint1)
 (visible_from objective0 waypoint2)
 (visible_from objective0 waypoint3)
 (visible_from objective1 waypoint0)
 (visible_from objective1 waypoint1)
 (visible_from objective1 waypoint2)
 (visible_from objective1 waypoint3)
 (= (at rover0) waypoint3)
 (= (at_lander general) waypoint0)
 (= (store_of rover0store) rover0)
 (= (calibration_target camera0) objective1)
 (= (on_board camera0) rover0)
)
(:global-goal (and
 (communicated_soil_data waypoint2)
 (communicated_rock_data waypoint3)
 (communicated_image_data objective1 high_res)
))
)
