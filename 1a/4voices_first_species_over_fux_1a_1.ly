\version "2.18.2"
\include "../shared/notationvideo.ly"

resolution = 130
largeSizeInPixels = 1980
smallSizeInPixels = 1080

% -- set page margins in millimeters
topBottomMargin = 10
leftRightMargin = 18

% -- define size of musical system (standard is 20pt)
#(set-global-staff-size 40)

% === derived settings ===
#(ly:set-option 'resolution resolution)
largeDimension = #(/ (* largeSizeInPixels 25.4) resolution)
smallDimension = #(/ (* smallSizeInPixels 25.4) resolution)

\paper {
  % -- remove all markup --
  print-page-number = ##f
  print-first-page-number = ##f
  evenFooterMarkup=##f
  oddFooterMarkup=##f
  evenHeaderMarkup=##f
  oddHeaderMarkup=##f
  %        bookTitleMarkup=##f
  scoreTitleMarkup=##f
  ragged-last-bottom=##f

  % set paper dimensions
  top-margin    = \topBottomMargin
  bottom-margin = \topBottomMargin
  paper-width   = \largeDimension
  paper-height  = \smallDimension
  line-width    = #(- paper-width (* 2 leftRightMargin))
}


\header {
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "First species counterpoint 1a in Lydian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key f \lydian
  \time 4/4
  \tempo 1=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"



cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_bass
}

counter_point_soprano = {
  \global
  \relative a'{
   a
   f
   g
   d'
   d
   a
   a
   e'
   a,
   g
   d
  }
}


counterpoint_alto = {
  \relative d' {
    d
    d
    c
    f
    d
    f
    e
    e
    f
    c
    d
  }
}

alto_lyrics = {
  \lyrics{
    "8"
    "6"
    "6"
    "10"
    "5"
    "8"
    "5"
    "6"
    "8"
    "6"
    "8"
  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative d {
    d
    a'
    g
    a
    b
    c
    c
    b
    c
    g
    d'
  }
}

soprano_lyrics = {
  \lyrics {
    "12"
    "8" 
    "10"
    "8" 
    "12"
    "10"
    "8" 
    "6"
    "10"
    "10"
    "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "1"
    "3"
    "3"
    "5"
    "3"
    "5"
    "3"
    "3"
    "5"
    "3"
    "8"
  }
}
%staff_two above staff_one
staff_one = \counter_point_soprano
staff_one_name = "Counterpoint one"
staff_one_instrument_name = "C.P1"
staff_one_lyrics = \soprano_lyrics

staff_two = \counterpoint_alto
staff_two_name = "Counterpoint two"
staff_two_instrument_name = "C.P2"
staff_two_lyrics = \alto_lyrics

staff_three = \counterpoint_tenor
staff_three_name = "Cantus Firmus"
staff_three_instrument_name = "C.P3"
staff_three_lyrics = \tenor_lyrics

staff_four = \cantus_firmus
staff_four_name = "Cantus Firmus"
staff_four_instrument_name = "C.F"
staff_four_lyrics = ""

% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = \staff_one_instrument_name
      \set Staf.midiInstrument = "recorder"
      \context Staff <<
        \context Voice = \staff_one_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>

      \new Staff <<
        \set Staff.instrumentName = \staff_two_instrument_name
        \set Staf.midiInstrument = "pan flute"
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
    \new Staff <<
      \set Staff.instrumentName = \staff_four_instrument_name
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = \staff_four_name { \staff_four }
        \addlyrics { \staff_four_lyrics }
      >>
    >>

  >>
  \layout {}
  \midi {}
}