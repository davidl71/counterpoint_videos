\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "J.Fux (Cantus)/David Lowes (C.P)"
  title = "1st species counterpoint 1a-3 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
%  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/1a_dorian.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}


counter_point =  \relative d' {
  \clef "treble"
  \global
  d a' g a b d c e d c d
}

%staff_one_first_from_bottom
staff_two = \cantus_firmus
staff_two_name = "C.F"
staff_two_instrument_name = "C.F"
staff_two_lyrics = ""

%staff_two above staff_one
staff_one = \counter_point
staff_one_name = "C.P"
staff_one_lyrics = \lyrics { "1" "3" "3" "5" "3" "6" "3" "6" "6" "6" "8" }
staff_one_instrument_name = "C.P"

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
  \layout {}
  \midi {}
}