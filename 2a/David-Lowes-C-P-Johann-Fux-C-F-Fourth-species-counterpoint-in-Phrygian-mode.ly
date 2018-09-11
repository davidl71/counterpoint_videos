\version "2.18.2"
\include "../shared/notationvideo.ly"

resolution = 229
largeSizeInPixels = 1980 * 2
smallSizeInPixels = 1080 * 2

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
  composer = "David Lowes(C.P)/Johann Fux(C.F)"
  title = "Fourth species counterpoint in Phrygian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key e\phrygian
  \time 2/2
  \tempo 2=60
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"



cantus_firmus = {
  \global
  \cantus_fux_twoa_phrygian_bass
}

counter_point_soprano = {
  \global
  \relative b{
    r2 b2~
    b a~
    a d
    e g~
    g f~
    f a
    b b~
    b c~
    c a
    e1
  }
}


counterpoint_alto = {
  \relative b' {
    b e, f c c c d g d e
  }
}

alto_lyrics = {
  \lyrics{
    "12"
    "10"
    "10"
    "8"
    "10"
    "3"
    "5"
    "10"
    "6"
    "8"
  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative g {
    gis e d g a c b g a gis
  }
}

soprano_lyrics = {
  \lyrics {
 "5      7"
 "6      5" "8"
 "10" "12    7"
 "6      6" "8"
 "10" "10  12"
 "6    12" "10" 
 "8"
  }
}

tenor_lyrics = {
  \lyrics {
"3#"
"3"
"1"
"5"
"8"
"3"
"3"
"3"
"3"
"3#"
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