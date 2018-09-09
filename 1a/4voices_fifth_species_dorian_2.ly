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
  #print-page-number = ##f
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
  composer = "D.Lowes/J.Fux"
  title = "Fifth Species counterpoint in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d\dorian
  \time 2/2
  \tempo 2=70
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"



cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_treble
}

counter_point_soprano = {
  \global
  \relative d'{
    d2 f4 e
    f2 g
    e e
    a
    f4 g
    b c d2
    a1
    a4 g f g
    g2 c
    d4 c a g
    a1
    a
  }
}


counterpoint_alto = {
  \relative d' {
    d1
    a'
    g
    a
    b
    c
    f,
    g
    a
    e
    a
  }
}

alto_lyrics = {
  \lyrics{
    "8"
    "12"
    "10"
    "10"
    "12"
    "10"
    "8"
    "10"
    "12"
    "10"
    "12"
  }
}

counterpoint_bass = {
  \clef "bass"
  \relative d {
    d
    d
    e
    f
    e
    a
    f
    e
    d
    c
    d
  }
}

soprano_lyrics = {
  \lyrics {
    "6" "10" "9"
    "10" "11"
    "8" "8"
    "10" "8" "9"
    "12" "6" "7"
    "8"
    "10" "9" "8" "9"
    "10" "6"
    "8" "7" "12" "11" "6" "12"
  }
}

tenor_lyrics = {
  \lyrics {
    "8" "1" "8" "6" "10" "6" "10" "10" "10" "10" "8"
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

staff_three = \cantus_firmus
staff_three_name = "Cantus Firmus"
staff_three_instrument_name = "C.F"
staff_three_lyrics = \tenor_lyrics

staff_four = \counterpoint_bass
staff_four_name = "Counterpoint Bass"
staff_four_instrument_name = "C.P3"
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