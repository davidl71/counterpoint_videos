\version "2.18.2"
\include "/home/david/Documents/Jamd/Torat_A/excersises/shared/notationvideo.ly"

\header {
  composer = "Johann Fux"
  subtitle = "Gradus ad Parnasus Liber Secundus"
  title = "Model cantus firmus 3b in Lydian mode"
  %tagline = "David Lowes"
  tagline = ""
  %copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key f \lydian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_firmus = {
  \global
  \cantus_fux_threeb_lydian_treble
}

% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = "C.F"
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = "cantus firmus" { \cantus_firmus  }
      >>
    >>
  >>
  \layout {}
  \midi {}
}