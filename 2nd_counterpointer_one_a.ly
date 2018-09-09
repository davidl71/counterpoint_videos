\version "2.18.2"

\header {
  composer = "David Lowes(C.P)/Counterpointer Software(C.F)"
  title = "Second species exercise a-1 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 2=80
}

\include "/home/david/Documents/counterpoint/model_cf_include/generated/counterpointer.ly"

cantus_firmus = {
  \global
  \cantus_counterpointer_one_bass
}


counter_point = {
  \global
  \counter_point_david_over_counterpointer_one
}

staff_two_lyrics = ""

%staff_two above staff_one
staff_one = \counter_point
staff_one_name = "Cantus Firmus"
staff_one_instrument_name = "C.P"
staff_one_lyrics = \counter_point_david_over_counterpointer_one_lyrics

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
      \set Staff.shortInstrumentName = "Da."
      \context Staff <<
        \context Voice = \staff_two_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>
    >>
    \new Staff <<
      \set Staff.instrumentName = \staff_two_instrument_name
      \set Staf.midiInstrument = "acoustic grand"
      \set Staff.shortInstrumentName = "Da."
      \context Staff <<
        \context Voice = \staff_two_name { \staff_two }
        \addlyrics { \staff_two_lyrics }
      >>
    >>
  >>
  \layout {}
  \midi {}
}
