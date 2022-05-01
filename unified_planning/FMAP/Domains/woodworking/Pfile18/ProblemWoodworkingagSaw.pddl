(define (problem wood-prob)
(:domain woodworking)
(:objects
 agPlanner agGrinder agVarnisher agSaw - agent
 grinder0 - grinder
 glazer0 - glazer
 immersion-varnisher0 - immersion-varnisher
 planer0 - planer
 highspeed-saw0 - highspeed-saw
 spray-varnisher0 - spray-varnisher
 saw0 - saw
 black white red green mauve blue - acolour
 walnut beech teak - awood
 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 - part
 b0 b1 b2 - board
 s0 s1 s2 s3 s4 s5 s6 s7 s8 - aboardsize
)
(:shared-data
 (unused ?obj - part) (available ?obj - woodobj)
 (empty ?m - highspeed-saw) (is-smooth ?surface - surface)
 (has-colour ?machine - machine ?colour - acolour)
 ((surface-condition ?obj - woodobj) - surface)
 ((treatment ?obj - part) - treatmentstatus)
 ((colour ?obj - part) - acolour)
 ((wood ?obj - woodobj) - awood)
 ((boardsize ?board - board) - aboardsize)
 ((goalsize ?part - part) - apartsize)
 ((boardsize-successor ?size1 - aboardsize) - aboardsize)
 ((in-highspeed-saw ?m - highspeed-saw) - board)
 ((grind-treatment-change ?old - treatmentstatus) - treatmentstatus)
 - (either agPlanner agGrinder agVarnisher))
(:init
 (= (colour p0) natural)
 (unused p0)
 (= (goalsize p0) large)
 (not (available p0))
 (= (wood p0) unknown-wood)
 (= (surface-condition p0) smooth)
 (= (treatment p0) untreated)
 (= (colour p1) natural)
 (unused p1)
 (= (goalsize p1) small)
 (not (available p1))
 (= (wood p1) unknown-wood)
 (= (surface-condition p1) smooth)
 (= (treatment p1) untreated)
 (= (colour p2) natural)
 (unused p2)
 (= (goalsize p2) medium)
 (not (available p2))
 (= (wood p2) unknown-wood)
 (= (surface-condition p2) smooth)
 (= (treatment p2) untreated)
 (= (colour p3) natural)
 (unused p3)
 (= (goalsize p3) medium)
 (not (available p3))
 (= (wood p3) unknown-wood)
 (= (surface-condition p3) smooth)
 (= (treatment p3) untreated)
 (= (colour p4) natural)
 (unused p4)
 (= (goalsize p4) small)
 (not (available p4))
 (= (wood p4) unknown-wood)
 (= (surface-condition p4) smooth)
 (= (treatment p4) untreated)
 (= (colour p5) natural)
 (unused p5)
 (= (goalsize p5) medium)
 (not (available p5))
 (= (wood p5) unknown-wood)
 (= (surface-condition p5) smooth)
 (= (treatment p5) untreated)
 (= (colour p6) natural)
 (unused p6)
 (= (goalsize p6) medium)
 (not (available p6))
 (= (wood p6) unknown-wood)
 (= (surface-condition p6) smooth)
 (= (treatment p6) untreated)
 (= (colour p7) natural)
 (unused p7)
 (= (goalsize p7) small)
 (not (available p7))
 (= (wood p7) unknown-wood)
 (= (surface-condition p7) smooth)
 (= (treatment p7) untreated)
 (= (colour p8) white)
 (unused p8)
 (= (goalsize p8) large)
 (available p8)
 (= (wood p8) walnut)
 (= (surface-condition p8) rough)
 (= (treatment p8) colourfragments)
 (= (colour p9) natural)
 (unused p9)
 (= (goalsize p9) small)
 (not (available p9))
 (= (wood p9) unknown-wood)
 (= (surface-condition p9) smooth)
 (= (treatment p9) untreated)
 (= (grind-treatment-change varnished) colourfragments)
 (= (grind-treatment-change glazed) untreated)
 (= (grind-treatment-change untreated) untreated)
 (= (grind-treatment-change colourfragments) untreated)
 (is-smooth verysmooth)
 (is-smooth smooth)
 (not (is-smooth rough))
 (= (boardsize-successor s0) s1)
 (= (boardsize-successor s1) s2)
 (= (boardsize-successor s2) s3)
 (= (boardsize-successor s3) s4)
 (= (boardsize-successor s4) s5)
 (= (boardsize-successor s5) s6)
 (= (boardsize-successor s6) s7)
 (= (boardsize-successor s7) s8)
 (not (has-colour grinder0 natural))
 (not (has-colour grinder0 black))
 (not (has-colour grinder0 white))
 (not (has-colour grinder0 red))
 (not (has-colour grinder0 green))
 (not (has-colour grinder0 mauve))
 (not (has-colour grinder0 blue))
 (not (has-colour glazer0 natural))
 (not (has-colour glazer0 black))
 (has-colour glazer0 white)
 (has-colour glazer0 red)
 (has-colour glazer0 green)
 (has-colour glazer0 mauve)
 (not (has-colour glazer0 blue))
 (not (has-colour immersion-varnisher0 natural))
 (not (has-colour immersion-varnisher0 black))
 (not (has-colour immersion-varnisher0 white))
 (has-colour immersion-varnisher0 red)
 (not (has-colour immersion-varnisher0 green))
 (has-colour immersion-varnisher0 mauve)
 (not (has-colour immersion-varnisher0 blue))
 (not (has-colour planer0 natural))
 (not (has-colour planer0 black))
 (not (has-colour planer0 white))
 (not (has-colour planer0 red))
 (not (has-colour planer0 green))
 (not (has-colour planer0 mauve))
 (not (has-colour planer0 blue))
 (not (has-colour highspeed-saw0 natural))
 (not (has-colour highspeed-saw0 black))
 (not (has-colour highspeed-saw0 white))
 (not (has-colour highspeed-saw0 red))
 (not (has-colour highspeed-saw0 green))
 (not (has-colour highspeed-saw0 mauve))
 (not (has-colour highspeed-saw0 blue))
 (not (has-colour spray-varnisher0 natural))
 (not (has-colour spray-varnisher0 black))
 (not (has-colour spray-varnisher0 white))
 (has-colour spray-varnisher0 red)
 (not (has-colour spray-varnisher0 green))
 (has-colour spray-varnisher0 mauve)
 (not (has-colour spray-varnisher0 blue))
 (not (has-colour saw0 natural))
 (not (has-colour saw0 black))
 (not (has-colour saw0 white))
 (not (has-colour saw0 red))
 (not (has-colour saw0 green))
 (not (has-colour saw0 mauve))
 (not (has-colour saw0 blue))
 (= (in-highspeed-saw highspeed-saw0) no-board)
 (= (boardsize b0) s8)
 (= (wood b0) beech)
 (= (surface-condition b0) rough)
 (available b0)
 (= (boardsize b1) s6)
 (= (wood b1) teak)
 (= (surface-condition b1) rough)
 (available b1)
 (= (boardsize b2) s5)
 (= (wood b2) walnut)
 (= (surface-condition b2) smooth)
 (available b2)
)
(:global-goal (and
 (available p0)
 (= (colour p0) mauve)
 (= (surface-condition p0) smooth)
 (available p1)
 (= (surface-condition p1) verysmooth)
 (= (treatment p1) glazed)
 (available p2)
 (= (wood p2) teak)
 (= (treatment p2) glazed)
 (available p3)
 (= (wood p3) teak)
 (= (surface-condition p3) smooth)
 (= (treatment p3) glazed)
 (available p4)
 (= (wood p4) teak)
 (= (surface-condition p4) verysmooth)
 (available p5)
 (= (colour p5) white)
 (= (wood p5) walnut)
 (= (surface-condition p5) verysmooth)
 (= (treatment p5) glazed)
 (available p6)
 (= (colour p6) green)
 (= (wood p6) beech)
 (= (treatment p6) glazed)
 (available p7)
 (= (surface-condition p7) verysmooth)
 (= (treatment p7) glazed)
 (available p8)
 (= (wood p8) walnut)
 (= (surface-condition p8) verysmooth)
 (available p9)
 (= (colour p9) red)
 (= (surface-condition p9) smooth)
))
)
