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
 blue green black red white mauve - acolour
 cherry walnut - awood
 p0 p1 p2 p3 p4 p5 p6 p7 - part
 b0 b1 - board
 s0 s1 s2 s3 s4 s5 s6 - aboardsize
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
 (= (goalsize p0) medium)
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
 (= (goalsize p2) large)
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
 (= (colour p4) black)
 (unused p4)
 (= (goalsize p4) medium)
 (available p4)
 (= (wood p4) cherry)
 (= (surface-condition p4) rough)
 (= (treatment p4) varnished)
 (= (colour p5) green)
 (unused p5)
 (= (goalsize p5) medium)
 (available p5)
 (= (wood p5) cherry)
 (= (surface-condition p5) smooth)
 (= (treatment p5) colourfragments)
 (= (colour p6) natural)
 (unused p6)
 (= (goalsize p6) small)
 (not (available p6))
 (= (wood p6) unknown-wood)
 (= (surface-condition p6) smooth)
 (= (treatment p6) untreated)
 (= (colour p7) black)
 (unused p7)
 (= (goalsize p7) large)
 (available p7)
 (= (wood p7) walnut)
 (= (surface-condition p7) rough)
 (= (treatment p7) varnished)
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
 (not (has-colour grinder0 natural))
 (not (has-colour grinder0 blue))
 (not (has-colour grinder0 green))
 (not (has-colour grinder0 black))
 (not (has-colour grinder0 red))
 (not (has-colour grinder0 white))
 (not (has-colour grinder0 mauve))
 (not (has-colour glazer0 natural))
 (has-colour glazer0 blue)
 (not (has-colour glazer0 green))
 (has-colour glazer0 black)
 (not (has-colour glazer0 red))
 (not (has-colour glazer0 white))
 (has-colour glazer0 mauve)
 (not (has-colour immersion-varnisher0 natural))
 (has-colour immersion-varnisher0 blue)
 (has-colour immersion-varnisher0 green)
 (has-colour immersion-varnisher0 black)
 (not (has-colour immersion-varnisher0 red))
 (not (has-colour immersion-varnisher0 white))
 (has-colour immersion-varnisher0 mauve)
 (not (has-colour planer0 natural))
 (not (has-colour planer0 blue))
 (not (has-colour planer0 green))
 (not (has-colour planer0 black))
 (not (has-colour planer0 red))
 (not (has-colour planer0 white))
 (not (has-colour planer0 mauve))
 (not (has-colour highspeed-saw0 natural))
 (not (has-colour highspeed-saw0 blue))
 (not (has-colour highspeed-saw0 green))
 (not (has-colour highspeed-saw0 black))
 (not (has-colour highspeed-saw0 red))
 (not (has-colour highspeed-saw0 white))
 (not (has-colour highspeed-saw0 mauve))
 (not (has-colour spray-varnisher0 natural))
 (has-colour spray-varnisher0 blue)
 (has-colour spray-varnisher0 green)
 (has-colour spray-varnisher0 black)
 (not (has-colour spray-varnisher0 red))
 (not (has-colour spray-varnisher0 white))
 (has-colour spray-varnisher0 mauve)
 (not (has-colour saw0 natural))
 (not (has-colour saw0 blue))
 (not (has-colour saw0 green))
 (not (has-colour saw0 black))
 (not (has-colour saw0 red))
 (not (has-colour saw0 white))
 (not (has-colour saw0 mauve))
 (= (in-highspeed-saw highspeed-saw0) no-board)
 (= (boardsize b0) s5)
 (= (wood b0) cherry)
 (= (surface-condition b0) smooth)
 (available b0)
 (= (boardsize b1) s6)
 (= (wood b1) walnut)
 (= (surface-condition b1) rough)
 (available b1)
)
(:global-goal (and
 (available p0)
 (= (colour p0) black)
 (= (wood p0) walnut)
 (available p1)
 (= (colour p1) blue)
 (= (wood p1) cherry)
 (available p2)
 (= (wood p2) walnut)
 (= (surface-condition p2) smooth)
 (available p3)
 (= (colour p3) blue)
 (= (wood p3) cherry)
 (= (surface-condition p3) verysmooth)
 (= (treatment p3) varnished)
 (available p4)
 (= (colour p4) mauve)
 (= (surface-condition p4) smooth)
 (available p5)
 (= (wood p5) cherry)
 (= (surface-condition p5) smooth)
 (= (treatment p5) varnished)
 (available p6)
 (= (colour p6) green)
 (= (treatment p6) varnished)
 (available p7)
 (= (wood p7) walnut)
 (= (surface-condition p7) smooth)
 (= (treatment p7) varnished)
))
)
