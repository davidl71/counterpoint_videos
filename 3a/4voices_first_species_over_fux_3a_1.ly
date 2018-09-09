\version "2.18.2"
\include "../shared/notationvideo.ly"

resolution = 150 * 1.5
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
  composer = "D. Lowes(C.P)/J. Fux(C.F)"
  title = "Fifth species counterpoint b-1 in Lydian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key f \lydian
  \time 4/4
  \tempo 4=140
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"



cantus_firmus = {
  \global
  \cantus_fux_threeb_lydian_treble_low
}

counter_point_soprano = {
  \global
  \relative f'{
    f2 c'
    g4 a e g
    f2 f8 e f4
    f2. g4
    a g a2~
    a g4 f
    f2 f4 g
    g1
    a2 f8 g a g
    f2 f8 d e4
    e1
    f
  }
}


counterpoint_tenor = {
  \relative c' {
    c
    e
    f
    f
    f
    e
    d
    c
    c
    c
    b
    c

  }
}

alto_lyrics = {
  \lyrics{
    "8"
    "6"
    "3"
    "8"
    "10"
    "10"
    "8"
    "3"
    "5"
    "8"
    "6"
    "5"
  }
}

counterpoint_alto = {
  \clef "treble"
  \relative f' {
    f
    e
    c
    f
    f
    g
    f
    e
    e
    f
    e
    c
  }
}

soprano_lyrics = {
  \lyrics {
    "8" "12"
    "8" "9" "6" "8"
    "6" "6" "5" "6"
    "8" "9"
    "12" "11" "12 11"
    "10" "9"
    "8" "8" "9"
    "5"
    "8" "6" "7" "8" "7"
    "8" "8" "6" "7"
    "6" "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "5"
    "6"
    "6"
    "8"
    "10"
    "8"
    "6"
    "1"
    "3"
    "5"
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
        \set Staf.midiInstrument = "recorder"
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