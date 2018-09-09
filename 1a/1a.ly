\version "2.18.2"
\include "notationvideo.ly"
\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

\header {
  title = "1st Species Counterpoint in Dorian mode"
  composer = "J. Fux (Cantus)/David Lowes (C.P)"
  tagline = ""
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 1=60
}

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}

counterpoint_soprano =  \relative a' {
  \global
  a1
  a
  g
  a
  b
  c
  f
  e
  a,
  c
  d
}

soprano_lyrics = {
  \lyrics {
    "5"
    "3"
    "3"
    "5"
    "3"
    "5"
    "6"
    "6"
    "3"
    "6"
    "8"
  }
}

staff_one_lyrics = \soprano_lyrics
staff_two_lyrics = \lyrics{}

% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = "C.P"
      \set staff.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "Cantus" { \counterpoint_soprano }
        \addlyrics { \staff_one_lyrics }
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "C.F"
      \set staff.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "C.P" { \cantus_firmus }
        \addlyrics { \staff_two_lyrics }
      >>
    >>
  >>
  \layout{}
  \midi {}
}

