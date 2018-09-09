  % === settings of target device ===
    % -- set resolution to 132ppi, page size to 1024x768
%    resolution = 132
%    largeSizeInPixels = 1920
%    smallSizeInPixels = 1080

    resolution = 210
    largeSizeInPixels = 3840
    smallSizeInPixels = 2060

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
