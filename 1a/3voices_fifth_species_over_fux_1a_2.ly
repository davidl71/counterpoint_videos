\version "2.18.2"
%\include "notationvideo.ly"

 % === settings of target device ===
    % -- set resolution to 132ppi, page size to 1024x768
    resolution = 237
    largeSizeInPixels = 3840
    smallSizeInPixels = 2160

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
  title = "Fifth species exercise a-1 in Dorian mode"
  %tagline = "David Lowes"
  tagline = ""
  %  copyright = \markup { \char ##x00A9 "2018" David Lowes }
}

global = {
  \key d \dorian
  \time 4/4
  \tempo 4=140
}

\include "/home/david/Documents/counterpoint/model_cf_include/jfux/jfux_cantus_firmus.ly"
%\include "/home/david/Documents/counterpoint/model_cf_include/jfux/counterpoint_over_fux.ly"

cantus_firmus = {
  \global
  \cantus_fux_onea_dorian_bass
}

counter_point_soprano = {
  \global
  \relative a'{
    a2 b4 a |
    a c d c |
    c2 c8 b c4 |
    d2. r4 |
    g,2 b4 c |
    d2 f4 e |
    c2 c~ |
    c b4 a |
    a g a b |
    c2 b4 c |
    d1
  }
}

counterpoint_tenor = {
  \clef "treble_8"
  \relative a {
    a1
    a
    c
    a
    g
    a
    a
    d
    a
    g
    fis
  }
}

soprano_lyrics = {
  \lyrics {
    "12" "6" "12"
    "10" "12" "6" "12"
    "6" "6" "12" "5"
    "8"
    "8" "10" "11"
    "6" "8" "7"
    "10" "10     11" "10" "9"
    "10" "9" "10" "11"
    "6" "12" "6"
    "8"
  }
}

tenor_lyrics = {
  \lyrics {
    "5"
    "3"
    "6"
    "5"
    "1"
    "3"
    "1"
    "5"
    "3"
    "3"
    "3#"
  }
}
%staff_two above staff_one
staff_one = \counter_point_soprano
staff_one_name = "Cantus Firmus"
staff_one_instrument_name = "C.P1"
staff_one_lyrics = \soprano_lyrics

staff_two = \counterpoint_tenor
staff_two_name = "Cantus Firmus"
staff_two_instrument_name = "C.P2"
staff_two_lyrics = \tenor_lyrics

staff_three = \cantus_firmus
staff_three_name = "Counter point"
staff_three_instrument_name = "C.F"
staff_three_lyrics = ""


% The score definition
\score {
  <<
    \new Staff <<
      \set Staff.instrumentName = \staff_one_instrument_name
      \set Staf.midiInstrument = "church organ"
      \context Staff <<
        \context Voice = \staff_one_name { \staff_one  }
        \addlyrics { \staff_one_lyrics }
      >>

      \new Staff <<
        \set Staff.instrumentName = \staff_two_instrument_name
        \set Staf.midiInstrument = "church organ"
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
  >>
  \layout {}
  \midi {}
}