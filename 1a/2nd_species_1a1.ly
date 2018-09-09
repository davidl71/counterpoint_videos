\version "2.18.2"
\include "notationvideo.ly"

\header {
  composer = "J.Fux (Cantus)/David Lowes (C.P)"
  title = \markup {"Second species exercise 1a-2 in Dorian mode"}
  %tagline = "David Lowes"
  tagline = ""
%  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 2=80
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}


counter_point =  \relative a' {
  \clef "treble"
  \global
  a2 f a c c g a b d c d a c f g e c a g c d1
  \bar "|."
}

staff_two_lyrics = ""

%staff_two above staff_one
staff_one = \counter_point
staff_one_name = "Cantus Firmus"
staff_one_instrument_name = "C.P"

%Interval numbers between cantus and top cp
staff_one_lyrics = \lyricmode { "5" "3" "5" "5" "6" "3" "5" "6" "5" "4" "6" "3" "3" "6" "8" "6" "5" "3" "3" "6" "8" }

%staff_two_first_from_bottom
staff_two = \cantus_firmus
staff_two_name = "Counter point"
staff_two_instrument_name = "C.F"


% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = \staff_one_instrument_name
      \set Staf.midiInstrument = "acoustic grand"
      \context Staff <<
        \context Voice = \staff_two_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = \staff_two_instrument_name
      \set Staf.midiInstrument = "acoustic grand"
      \context Staff <<
        \context Voice = \staff_two_name { \staff_two }
        \addlyrics { \staff_two_lyrics }
      >>
    >>
  >>
  \layout {}
  \midi {}
}