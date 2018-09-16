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
  title = "Counterpoint in Phrygian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key e\phrygian
  \time 2/2
  \tempo 2=70
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_fux_twoa_phrygian_bass = {
  \clef "bass"
  \relative e {
    e c b c a a' g e f e
    \bar "|."
  }
}

cantus_firmus = {
  \global
  \cantus_fux_twoa_phrygian_bass
}

counter_point_soprano = {
  \global
  \relative e''{
    r2 e
    e4 c g a
    b1
    e,4 f g a
    a2 f4 e
    d2. g8f
    g4 f e d
    g g8f g4 a
    a b c2
    e1
  }
}


counterpoint_alto = {
  \relative a {
    a e' b c e f e g a e
  }
}

alto_lyrics = {
  \lyrics{
    "5" "10" "6" "8" "12" "6" "6" "10" "10" "8"
  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative g {
    gis e f g a a b b d e
  }
}

soprano_lyrics = {
  \lyrics {
    "8"
    "10" "8" "12" "6"
    "6"
    "10" "11" "12" "6"
    "8" "6" "12"
    "4" "7" "6"
    "8" "7" "6" "5"
    "10" "10" "9" "10" "11"
    "10" "11" "12"
    "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "3" "3" "3" "5" "8" "1" "3" "5" "6" "8"
  }
}
%staff_two above staff_one
staff_one = \counter_point_soprano
staff_one_name = "Counterpoint soprano"
staff_one_instrument_name = "C.P1"
staff_one_lyrics = \soprano_lyrics

staff_two = \counterpoint_alto
staff_two_name = "Counterpoint alto"
staff_two_instrument_name = "C.P2"
staff_two_lyrics = \alto_lyrics

staff_three = \counterpoint_tenor
staff_three_name = "Counterpoint tenor"
staff_three_instrument_name = "C.P3"
staff_three_lyrics = \tenor_lyrics

staff_four = \cantus_firmus
staff_four_name = "Cantus_firmus"
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