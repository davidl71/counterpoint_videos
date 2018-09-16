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
  composer = "David Lowes (C.P)/Johann Fux(C.F)"
  title = "Fifth species counterpoint in Ionian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key c\ionian
  \time 2/2
  \tempo 2=70
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_fux_fivea_ionian_bass = {
  \clef "bass"
  \relative c {
    c1 e f g e a g e f e d c \bar "|."
  }
}

cantus_firmus = {
  \global
  \cantus_fux_fivea_ionian_bass
}

counter_point_soprano = {
  \global
  \relative g'{
    g2 a
    g c4 d
    d c b a
    g1
    g2 g4 c
    c d e f
    e2 b8a b4
    c2 b4 g
    d' c8b a4 b
    c b g a
    b1
    c
  }
}


counterpoint_alto = {
  \relative c' {
    c c d e b c e g f g f c'
  }
}

alto_lyrics = {
  \lyrics{
    "8"
    "6"
    "6"
    "6"
    "5"
    "4"
    "6"
    "10"
    "8"
    "10"
    "10"
    "8"
  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative g {
    g g f e g a b g a c f, g
  }
}

soprano_lyrics = {
  \lyrics {
    "12" "6"
    "10" "6" "7"
    "6" "12" "11" "10"
    "8"
    "10" "10" "6"
    "10" "11" "12" "6"
    "6" "10" "9" "10"
    "6" "12" "10"
    "6" "12" "11" "10" "11"
    "6" "12" "10" "11"
    "6"
    "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "5"
    "3"
    "1"
    "3"
    "3"
    "1"
    "3"
    "3"
    "3"
    "6"
    "3"
    "5"
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
staff_three_name = "Counterpoint three"
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