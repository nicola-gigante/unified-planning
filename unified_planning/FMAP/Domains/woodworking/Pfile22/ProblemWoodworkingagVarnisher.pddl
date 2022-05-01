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
 red black blue - acolour
 pine mahogany - awood
 p0 p1 p2 p3 - part
 b0 b1 - board
 s0 s1 s2 s3 s4 s5 - aboardsize
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
 - (either agPlanner agGrinder agSaw))
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
 (= (goalsize p1) large)
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
 (= (goalsize p3) large)
 (not (available p3))
 (= (wood p3) unknown-wood)
 (= (surface-condition p3) smooth)
 (= (treatment p3) untreated)
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
 (not (has-colour grinder0 natural))
 (not (has-colour grinder0 red))
 (not (has-colour grinder0 black))
 (not (has-colour grinder0 blue))
 (has-colour glazer0 natural)
 (not (has-colour glazer0 red))
 (has-colour glazer0 black)
 (not (has-colour glazer0 blue))
 (has-colour immersion-varnisher0 natural)
 (not (has-colour immersion-varnisher0 red))
 (has-colour immersion-varnisher0 black)
 (not (has-colour immersion-varnisher0 blue))
 (not (has-colour planer0 natural))
 (not (has-colour planer0 red))
 (not (has-colour planer0 black))
 (not (has-colour planer0 blue))
 (not (has-colour highspeed-saw0 natural))
 (not (has-colour highspeed-saw0 red))
 (not (has-colour highspeed-saw0 black))
 (not (has-colour highspeed-saw0 blue))
 (has-colour spray-varnisher0 natural)
 (not (has-colour spray-varnisher0 red))
 (has-colour spray-varnisher0 black)
 (not (has-colour spray-varnisher0 blue))
 (not (has-colour saw0 natural))
 (not (has-colour saw0 red))
 (not (has-colour saw0 black))
 (not (has-colour saw0 blue))
 (= (in-highspeed-saw highspeed-saw0) no-board)
 (= (boardsize b0) s5)
 (= (wood b0) mahogany)
 (= (surface-condition b0) rough)
 (available b0)
 (= (boardsize b1) s5)
 (= (wood b1) pine)
 (= (surface-condition b1) rough)
 (available b1)
)
(:global-goal (and
 (available p0)
 (= (colour p0) black)
 (= (wood p0) mahogany)
 (available p1)
 (= (wood p1) pine)
 (= (surface-condition p1) smooth)
 (available p2)
 (= (wood p2) pine)
 (= (treatment p2) varnished)
 (available p3)
 (= (colour p3) natural)
 (= (wood p3) mahogany)
))
)
