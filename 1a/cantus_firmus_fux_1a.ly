\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "Johann Fux"
  title = "Fifth species exercise a-1 in Dorian mode"
  subtitle = "Gradus Ad Parnasus Liber Secundus"
  %tagline = "David Lowes"
  tagline = ""
  %copyright = \markup { \char ##x00A9 "2018" David Lowes }
}


global = {
  \key d \dorian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}


%staff_two above staff_one
staff_one = \cantus_firmus
staff_one_name = "C.F"
staff_one_instrument_name = "C.P"
staff_one_lyrics = \lyrics {D F E D G F A G F E D}


% The score definition
\score {
  <<
    \new Staff \with {
      instrumentName = \staff_one_instrument_name
      midiInstrument = "church organ"
    } <<
      \context Staff <<
        \context Voice = \staff_one_name { \staff_one  }
     \addlyrics \staff_one_lyrics
      >>

    >>
  >>
  \layout {
  }
  \midi {}
}
