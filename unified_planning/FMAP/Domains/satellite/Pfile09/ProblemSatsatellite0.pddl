(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
 satellite0 satellite1 satellite2 satellite3 satellite4 - satellite
 instrument0 instrument1 instrument2 instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10 - instrument
 spectrograph0 image3 image4 infrared1 image2 - mode
 star4 star3 groundstation1 star0 star2 planet5 phenomenon6 phenomenon7 phenomenon8 star9 planet10 planet11 phenomenon12 phenomenon13 star14 - direction
)
(:shared-data
  ((pointing ?s - satellite) - direction)
  (have_image ?d - direction ?m - mode) - (either satellite1 satellite2 satellite3 satellite4)
)
(:init (mySatellite satellite0)
 (power_avail satellite0)
 (not (power_on instrument0))
 (not (calibrated instrument0))
 (= (calibration_target instrument0) star3)
 (not (power_on instrument1))
 (not (calibrated instrument1))
 (= (calibration_target instrument1) star4)
 (not (power_on instrument2))
 (not (calibrated instrument2))
 (= (calibration_target instrument2) star2)
 (not (power_on instrument3))
 (not (calibrated instrument3))
 (= (calibration_target instrument3) star2)
 (not (power_on instrument4))
 (not (calibrated instrument4))
 (= (calibration_target instrument4) star3)
 (not (power_on instrument5))
 (not (calibrated instrument5))
 (= (calibration_target instrument5) star3)
 (not (power_on instrument6))
 (not (calibrated instrument6))
 (= (calibration_target instrument6) star2)
 (not (power_on instrument7))
 (not (calibrated instrument7))
 (= (calibration_target instrument7) star0)
 (not (power_on instrument8))
 (not (calibrated instrument8))
 (= (calibration_target instrument8) groundstation1)
 (not (power_on instrument9))
 (not (calibrated instrument9))
 (= (calibration_target instrument9) star0)
 (not (power_on instrument10))
 (not (calibrated instrument10))
 (= (calibration_target instrument10) star2)
 (not (have_image planet5 image2))
 (not (have_image phenomenon6 image3))
 (not (have_image phenomenon7 infrared1))
 (not (have_image phenomenon8 image2))
 (not (have_image star9 image3))
 (not (have_image planet10 image4))
 (not (have_image planet11 spectrograph0))
 (not (have_image phenomenon12 image3))
 (not (have_image phenomenon13 spectrograph0))
 (not (have_image star14 image4))
 (= (pointing satellite0) star0)
 (= (on_board satellite0) {instrument0 instrument1 instrument2})
 (not (= (on_board satellite0) {instrument3 instrument4 instrument5 instrument6 instrument7 instrument8 instrument9 instrument10}))
 (= (supports instrument0) {image4 infrared1})
 (not (= (supports instrument0) {spectrograph0 image3 image2}))
 (= (supports instrument1) {spectrograph0 image4 image2})
 (not (= (supports instrument1) {image3 infrared1}))
 (= (supports instrument2) {image2})
 (not (= (supports instrument2) {spectrograph0 image3 image4 infrared1}))
 (= (supports instrument3) {image3 image4 image2})
 (not (= (supports instrument3) {spectrograph0 infrared1}))
 (= (supports instrument4) {image3 image2})
 (not (= (supports instrument4) {spectrograph0 image4 infrared1}))
 (= (supports instrument5) {spectrograph0 image4 infrared1})
 (not (= (supports instrument5) {image3 image2}))
 (= (supports instrument6) {spectrograph0 image2})
 (not (= (supports instrument6) {image3 image4 infrared1}))
 (= (supports instrument7) {spectrograph0 image3 image4})
 (not (= (supports instrument7) {infrared1 image2}))
 (= (supports instrument8) {image3 image4 infrared1})
 (not (= (supports instrument8) {spectrograph0 image2}))
 (= (supports instrument9) {image4})
 (not (= (supports instrument9) {spectrograph0 image3 infrared1 image2}))
 (= (supports instrument10) {image4 infrared1 image2})
 (not (= (supports instrument10) {spectrograph0 image3}))
)
(:global-goal (and
 (= (pointing satellite0) phenomenon7)
 (= (pointing satellite3) star9)
 (= (pointing satellite4) planet5)
 (have_image planet5 image2)
 (have_image phenomenon6 image3)
 (have_image phenomenon7 infrared1)
 (have_image phenomenon8 image2)
 (have_image star9 image3)
 (have_image planet10 image4)
 (have_image planet11 spectrograph0)
 (have_image phenomenon12 image3)
 (have_image phenomenon13 spectrograph0)
 (have_image star14 image4)
))
)
