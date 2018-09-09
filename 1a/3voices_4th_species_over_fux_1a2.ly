\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "Fourth species exercise a-1 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 2=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"
%\include "/home/david/Documents/counterpoint/model_cf_include/jfux/counterpoint_over_fux.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_bass
}

counter_point_soprano = {
  \global
  \relative a'{
    r2 a~
    a c~
    c b~
    b d~
    d e~
    e d~
    d a~
    a g~
    g a~
    a g
    a1
  }
}

under_fourth_species_over_jfux_one_a_lyrics = {
  \lyrics {

  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative a {
    a
    f
    g
    d'
    b
    c
    f,
    e
    d
    e
    fis
  }
}

soprano_lyrics = {
  \lyrics {
    "12  10"
    "12  6"
    "12  6"
    "8  12"
    "6    7"
    "6   11"
    "8    9"
    "8     9"
    "10  11"
    "10"
    "12"
  }
}

tenor_lyrics = {
  \lyrics {
    "5"
    "1"
    "3"
    "8"
    "3"
    "5"
    "3"
    "3"
    "3"
    "1"
    "3#"
  }
}
%staff_two above staff_one
staff_one = \counter_point_soprano
staff_one_name = "Cantus Firmus"
staff_one_instrument_name = "C.P1"
staff_one_lyrics = \soprano_lyrics

staff_two = \counterpoint_tenor
staff_two_name = "Cantus Firmus"
staff_two_instrument_name = "C.P2"
staff_two_lyrics = \tenor_lyrics

staff_three = \cantus_firmus
staff_three_name = "Counter point"
staff_three_instrument_name = "C.F"
staff_three_lyrics = ""


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
      \new Staff <<
        \set Staff.instrumentName = \staff_three_instrument_name
        \set Staf.midiInstrument = "church organ"
        \context Staff <<
          \context Voice = \staff_three_name { \staff_three }
          \addlyrics { \staff_three_lyrics }
        >>
      >>
    >>
  >>
  \layout {}
  \midi {}
}