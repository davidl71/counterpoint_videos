\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "First species counterpoint a-1 in Dorian mode"
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
%\include "/home/david/Documents/counterpoint/model_cf_include/jfux/counterpoint_over_fux.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_bass
}

counter_point_soprano = {
  \global
  \relative a'{
    a1
    d,
    g
    f
    g
    a
    f
    e
    a
    c
    d
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
    a
    b
    b
    b
    c
    c
    b
    c
    g
    a
  }
}

soprano_lyrics = {
  \lyrics {
    "12"
    "6"
    "10"
    "10"
    "8"
    "10"
    "6"
    "6"
    "10"
    "6"
    "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "5"
    "3"
    "5"
    "6"
    "3"
    "5"
    "3"
    "3"
    "5"
    "3"
    "5"
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