\version "2.18.2"
\include "notationvideo.ly"
\include "/home/david/Documents/counterpoint/model_cf_include/jfux/1a_dorian.ly"

\header {
  title = "1st species counterpoint 1a-2 in Dorian mode"
  composer = "J. Fux (Cantus Firmus)/David Lowes (C.P)"
  tagline = ""
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 1=60
}

Counterpoint =  \relative a' {
  \global
  \clef "treble"
  a1 | d | c | d | b | d | f | e | a,| c | d
}

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}

soprano_lyrics = {
  \lyrics {
    "5"
    "6"
    "6"
    "8"
    "10"
    "3"
    "6"
    "6"
    "3"
    "6"
    "8"
  }
}

staff_two_lyrics = {
  \lyrics {
""
  }
}

% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = "C.P"
      \set staff.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "Counterpoint" { \Counterpoint }
        \addlyrics \soprano_lyrics
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = "C.F"
      \set staff.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "C.F" { \cantus_firmus }
        \addlyrics \staff_two_lyrics
      >>
    >>

  >>
  %\layout {#(set-default-paper-size "a6" 'landscape)}
  \layout{}
  \midi {}
}

