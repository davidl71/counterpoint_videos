\version "2.18.2"
\include "../shared/notationvideo.ly"

resolution = 229
largeSizeInPixels = 1980 * 2
smallSizeInPixels = 1080 * 2

% -- set page margins in millimeters
topBottomMargin = 10 
leftRightMargin = 17

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
 %  bookTitleMarkup=##f
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
  title = "Counterpoint excersise in Mixolydian mode"
  % tagline = "David Lowes"
  % tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key g\mixolydian
  \time 4/4
  \tempo 4=140
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"

cantus_firmus = {
  \global
  \cantus_fux_fourb_mixolydian_treble
}

counter_point_soprano = {
  \global
  \relative d'{
    d2 f
    f4 e d f
    g a8 f g4 b
    d1
    c2. b4
    c a8 g a4 c
    a g f g
    g1 \break
    g2 b
    c e
    f4 c a a8 g
    g4 a e g a2 a8g a4
    b1
  }
}


counterpoint_alto = {
  \relative a' {
    b1 a b b c a a c e e d d d d
  }
}

alto_lyrics = {
  \lyrics{
    "3"   "1"   "3"   "3"   "6"   "6"   "5"   "6"   "6"   "5"   "6"   "5"   "8"   "5"
  }
}

counterpoint_bass = {
  \clef "bass"
  \relative d {
    g a g g e c d e g a f g b, g'
  }
}

soprano_lyrics = {
  \lyrics {
  "5"   "7" 
  "6"   "5"   "4"   "6" 
  "8"   "8"   "7"   "8"   "10" 
  "12" 
  "6"   "12" 
  "8"   "6"   "12"   "6"   "8" 
  "12"   "11"   "10"   "11" 
  "10" 
  "8"   "10" 
  "10"   "12" 
  "8"   "12"   "10"   "10"   "9" 
  "8"   "9"   "6"   "8" 
  "12"   "12"   "11"   "12" 
  "10" 
  }
}

tenor_lyrics = {
  \lyrics {
"1" "3" "3" "1" "6" "10" "8" "10" "6" "3" "6" "3" "5" "1"
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