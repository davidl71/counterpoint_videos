\version "2.18.2"
\include "../shared/notationvideo.ly"

    resolution = 210
    largeSizeInPixels = 3840
    smallSizeInPixels = 2060

    % -- set page margins in millimeters
    topBottomMargin = 5
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
  \relative a'{
    f2. g8a
    g4 f g a 
    c a2. 
    a4 g f e 
    d2 d8c d4
    c g' f2~ \noBreak
    f4 a f g 
    a2 a8g f4 
    f2. f8e 
    f4 e f g  
    g2 g8f g4 
    c1
  }
}

under_fourth_species_over_jfux_one_a_lyrics = {
  \lyrics {

  }
}


counterpoint_tenor = {
  \clef "treble"
  \relative a' {
 f1
 e
 f
 d
 f
 g
 a
 e
 f
 a
 g
 a
  }
}

soprano_lyrics = {
  \lyrics {
    "8" "9" "10"
    "8" "7" "8" "9"
    "10" "8"
    "10" "9" "8" "7"
    "8" "8" "7" "8"
    "6" "10" "9         8"
    "10" "8" "9"
    "6" "6" "5" "4"
    "6" "6" "5"
    "8" "7" "8" "9"
    "8" "8" "7" "8"
    "12"
  }
}

tenor_lyrics = {
  \lyrics {
    "8"
    "6"
    "6"
    "6"
    "10"
    "10"
    "10"
    "3"
    "6"
    "10"
    "8"
    "10"
  }
}
%staff_two above staff_one
staff_one = \counter_point_soprano
staff_one_name = "Counterpoint one"
staff_one_instrument_name = "C.P1"
staff_one_lyrics = \soprano_lyrics

staff_two = \counterpoint_tenor
staff_two_name = "Counterpoint two"
staff_two_instrument_name = "C.P2"
staff_two_lyrics = \tenor_lyrics

staff_three = \cantus_firmus
staff_three_name = "Cantus Firmus"
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