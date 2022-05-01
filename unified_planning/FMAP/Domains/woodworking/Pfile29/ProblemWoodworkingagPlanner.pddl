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
 red green black mauve white blue - acolour
 teak pine walnut - awood
 p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - part
 b0 b1 b2 b3 - board
 s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - aboardsize
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
 - (either agGrinder agVarnisher agSaw))
(:init
 (= (colour p0) natural)
 (unused p0)
 (= (goalsize p0) medium)
 (not (available p0))
 (= (wood p0) unknown-wood)
 (= (surface-condition p0) smooth)
 (= (treatment p0) untreated)
 (= (colour p1) natural)
 (unused p1)
 (= (goalsize p1) medium)
 (not (available p1))
 (= (wood p1) unknown-wood)
 (= (surface-condition p1) smooth)
 (= (treatment p1) untreated)
 (= (colour p2) natural)
 (unused p2)
 (= (goalsize p2) small)
 (not (available p2))
 (= (wood p2) unknown-wood)
 (= (surface-condition p2) smooth)
 (= (treatment p2) untreated)
 (= (colour p3) natural)
 (unused p3)
 (= (goalsize p3) large)
 (not (available p3))
 (= (wood p3) unknown-wood)
 (= (surface-condition p3) smooth)
 (= (treatment p3) untreated)
 (= (colour p4) natural)
 (unused p4)
 (= (goalsize p4) large)
 (not (available p4))
 (= (wood p4) unknown-wood)
 (= (surface-condition p4) smooth)
 (= (treatment p4) untreated)
 (= (colour p5) natural)
 (unused p5)
 (= (goalsize p5) large)
 (not (available p5))
 (= (wood p5) unknown-wood)
 (= (surface-condition p5) smooth)
 (= (treatment p5) untreated)
 (= (colour p6) natural)
 (unused p6)
 (= (goalsize p6) large)
 (available p6)
 (= (wood p6) walnut)
 (= (surface-condition p6) verysmooth)
 (= (treatment p6) varnished)
 (= (colour p7) natural)
 (unused p7)
 (= (goalsize p7) medium)
 (not (available p7))
 (= (wood p7) unknown-wood)
 (= (surface-condition p7) smooth)
 (= (treatment p7) untreated)
 (= (colour p8) natural)
 (unused p8)
 (= (goalsize p8) medium)
 (not (available p8))
 (= (wood p8) unknown-wood)
 (= (surface-condition p8) smooth)
 (= (treatment p8) untreated)
 (= (colour p9) natural)
 (unused p9)
 (= (goalsize p9) medium)
 (not (available p9))
 (= (wood p9) unknown-wood)
 (= (surface-condition p9) smooth)
 (= (treatment p9) untreated)
 (= (colour p10) natural)
 (unused p10)
 (= (goalsize p10) small)
 (not (available p10))
 (= (wood p10) unknown-wood)
 (= (surface-condition p10) smooth)
 (= (treatment p10) untreated)
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
 (= (boardsize-successor s8) s9)
 (not (has-colour grinder0 natural))
 (not (has-colour grinder0 red))
 (not (has-colour grinder0 green))
 (not (has-colour grinder0 black))
 (not (has-colour grinder0 mauve))
 (not (has-colour grinder0 white))
 (not (has-colour grinder0 blue))
 (has-colour glazer0 natural)
 (has-colour glazer0 red)
 (has-colour glazer0 green)
 (has-colour glazer0 black)
 (has-colour glazer0 mauve)
 (not (has-colour glazer0 white))
 (not (has-colour glazer0 blue))
 (has-colour immersion-varnisher0 natural)
 (not (has-colour immersion-varnisher0 red))
 (not (has-colour immersion-varnisher0 green))
 (not (has-colour immersion-varnisher0 black))
 (has-colour immersion-varnisher0 mauve)
 (has-colour immersion-varnisher0 white)
 (not (has-colour immersion-varnisher0 blue))
 (not (has-colour planer0 natural))
 (not (has-colour planer0 red))
 (not (has-colour planer0 green))
 (not (has-colour planer0 black))
 (not (has-colour planer0 mauve))
 (not (has-colour planer0 white))
 (not (has-colour planer0 blue))
 (not (has-colour highspeed-saw0 natural))
 (not (has-colour highspeed-saw0 red))
 (not (has-colour highspeed-saw0 green))
 (not (has-colour highspeed-saw0 black))
 (not (has-colour highspeed-saw0 mauve))
 (not (has-colour highspeed-saw0 white))
 (not (has-colour highspeed-saw0 blue))
 (has-colour spray-varnisher0 natural)
 (not (has-colour spray-varnisher0 red))
 (not (has-colour spray-varnisher0 green))
 (not (has-colour spray-varnisher0 black))
 (has-colour spray-varnisher0 mauve)
 (has-colour spray-varnisher0 white)
 (not (has-colour spray-varnisher0 blue))
 (not (has-colour saw0 natural))
 (not (has-colour saw0 red))
 (not (has-colour saw0 green))
 (not (has-colour saw0 black))
 (not (has-colour saw0 mauve))
 (not (has-colour saw0 white))
 (not (has-colour saw0 blue))
 (= (in-highspeed-saw highspeed-saw0) no-board)
 (= (boardsize b0) s9)
 (= (wood b0) teak)
 (= (surface-condition b0) rough)
 (available b0)
 (= (boardsize b1) s0)
 (= (wood b1) teak)
 (= (surface-condition b1) rough)
 (available b1)
 (= (boardsize b2) s8)
 (= (wood b2) pine)
 (= (surface-condition b2) rough)
 (available b2)
 (= (boardsize b3) s4)
 (= (wood b3) walnut)
 (= (surface-condition b3) rough)
 (available b3)
)
(:global-goal (and
 (available p0)
 (= (colour p0) red)
 (= (wood p0) walnut)
 (= (treatment p0) glazed)
 (available p1)
 (= (colour p1) green)
 (= (treatment p1) glazed)
 (available p2)
 (= (colour p2) natural)
 (= (surface-condition p2) verysmooth)
 (available p3)
 (= (surface-condition p3) verysmooth)
 (= (treatment p3) varnished)
 (available p4)
 (= (colour p4) black)
 (= (treatment p4) glazed)
 (available p5)
 (= (colour p5) white)
 (= (wood p5) pine)
 (= (surface-condition p5) smooth)
 (= (treatment p5) varnished)
 (available p6)
 (= (colour p6) mauve)
 (= (wood p6) walnut)
 (available p7)
 (= (surface-condition p7) smooth)
 (= (treatment p7) glazed)
 (available p8)
 (= (wood p8) pine)
 (= (surface-condition p8) verysmooth)
 (= (treatment p8) varnished)
 (available p9)
 (= (surface-condition p9) smooth)
 (= (treatment p9) varnished)
 (available p10)
 (= (wood p10) walnut)
 (= (surface-condition p10) smooth)
))
)
