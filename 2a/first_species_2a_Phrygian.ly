\version "2.18.2"
\include "/home/david/Documents/Jamd/Torat_A/excersises/shared/notationvideo.ly"

\header {
  composer = "J.Fux (Cantus)/David Lowes (C.P)"
  title = "First species counterpoint 2a in Phrygian mode"
  %tagline = "\c David Lowes"
  %copyright = \markup { \char ##x00A9 "2018" David L }
}

global = {
  \key e \phrygian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_firmus = {
  \global
  \cantus_fux_twoa_phrygian_treble
}

counter_point = {
  \global
  \relative b' {
    b1
    e,
    f
    e
    a
    c
    b
    c
    d
    e
  }
}

soprano_lyrics = {
  \lyrics {
    "5"
    "3"
    "3"
    "3"
    "8"
    "3"
    "3"
    "6"
    "6"
    "8"
  }
}

% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = "C.F"
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "counter_point" { \counter_point }
        \addlyrics \soprano_lyrics
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "C.P"
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "cantus_firmus" { \cantus_firmus }
      >>
    >>

  >>
  \layout {}
  \midi {}
}