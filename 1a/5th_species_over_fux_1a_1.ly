\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "Fifth species exercise a-1 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
%  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}


global = {
  \key d \dorian
  \time 4/4
  \tempo 4=140 
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"
\include "/home/david/Documents/counterpoint/model_cf_include/jfux/counterpoint_over_fux.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}

fith_species_over_jfux_one_a_b = {
  \global
  \relative a' {
    r4 a2 a8 g |
    a4 b c2~ |
    c e |
    f e |
    g e4 d|
    d c c2~ |
    c e4 c |
    d c b c |
    d2 c
    c c8 b c4 |
    d1
  }
}

counter_point = {
  \global
  \fith_species_over_jfux_one_a_b
}

under_fourth_species_over_jfux_one_a_lyrics = {
  \lyrics {
    "5" "5" "4"
    "3" "4" "5    6" "8"
    "10" "9"
    "8" "6" "5"
    "6" "5" "5    3"
    "5" "3"
    "5" "4" "3" "4"
    "6" "5"
    "6" "6" "5" "6"
    "8"
  }
}

staff_two_lyrics = ""

%staff_two above staff_one
staff_one = \counter_point
staff_one_name = "C.F"
staff_one_instrument_name = "C.P"
staff_one_lyrics = \under_fourth_species_over_jfux_one_a_lyrics

%staff_two_first_from_bottom
staff_two = \cantus_firmus
staff_two_name = "C.P"
staff_two_instrument_name = "C.F"



% The score definition
\score {
  <<
    \new Staff \with {
      instrumentName = \staff_one_instrument_name
      midiInstrument = "church organ"
    } <<
      \context Staff <<
        \context Voice = \staff_one_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>

      \new Staff \with {
        instrumentName = \staff_two_instrument_name
        midiInstrument = "church organ"
      }<<
        \context Staff <<
          \context Voice = \staff_two_name { \staff_two }
          \addlyrics { \staff_two_lyrics }
        >>
      >>
    >>
  >>
  \layout {
  }
  \midi {}
}
