\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "4th species counterpoint a-1 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
%  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}


global = {
  \key d \dorian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"
\include "/home/david/Documents/counterpoint/model_cf_include/jfux/counterpoint_over_fux.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}

fourth_species_over_jfux_one_a_b = {
  \global
  \relative a' {
    r2 a~
    a c~
    c b~
    b c
    b d~
    d c~
    c e~
    e d~
    d a~
    a g
    a1
  }
}

counter_point = {
  \global
  \fourth_species_over_jfux_one_a_b
}

under_fourth_species_over_jfux_one_a_lyrics = {
  \lyrics {
    "5     3"
    "5     6"
    "5     6"
    "7"   "3"
    "5     6"
    "5     3"
    "5     6"
    "5     6"
    "3     4"
    "3"
    "5"
  }
}

staff_two_lyrics = ""

%staff_two above staff_one
staff_one = \counter_point
staff_one_name = "Cantus Firmus"
staff_one_instrument_name = "C.P"
staff_one_lyrics = \under_fourth_species_over_jfux_one_a_lyrics

%staff_two_first_from_bottom
staff_two = \cantus_firmus
staff_two_name = "Counter point"
staff_two_instrument_name = "C.F"



% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = \staff_one_instrument_name
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = \staff_one_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>

      \new Staff <<
        \set Staff.instrumentName = \staff_two_instrument_name
        \set Staf.midiInstrument = "church organ"
        \context Staff <<
          \context Voice = \staff_two_name { \staff_two }
          \addlyrics { \staff_two_lyrics }
        >>
      >>
    >>
  >>
  \layout {}
  \midi {}
}
