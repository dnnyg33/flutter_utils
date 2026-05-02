import 'package:flutter/material.dart';

class DynamicColors extends ThemeExtension<DynamicColors> {
  // ---------------------------------------------------------------------------
  // Background
  // ---------------------------------------------------------------------------
  final Color bkgdBehindCard;
  final Color bkgdPrimary;
  final Color bkgdOne;
  final Color bkgdSecondary;
  final Color bkgdPrimaryBlue;
  final Color bkgdPrimaryAccentBlue;
  final Color bkgdSecondaryBlue;
  final Color bkgdTertiary;
  final Color bkgdQuaternary;
  final Color bkgdHighlightRowBlue;
  final Color bkgdTabActive;
  final Color bkgdReverse;

  // ---------------------------------------------------------------------------
  // Content
  // ---------------------------------------------------------------------------
  final Color contentPrimary;
  final Color contentPrimaryBlue;
  final Color contentPrimaryAccentBlue;
  final Color contentSecondary;
  final Color contentSecondaryBlue;
  final Color contentTertiary;
  final Color contentLinkBlue;
  final Color contentWhite;

  // ---------------------------------------------------------------------------
  // Color (Semantic / Status)
  // ---------------------------------------------------------------------------
  final Color redPrimary;
  final Color redSecondary;
  final Color redContent;
  final Color redBackground;
  final Color redBackgroundLighter;
  final Color greenPrimary;
  final Color greenBackground;
  final Color greenBackgroundLighter;
  final Color greenContent;
  final Color yellowPrimary;
  final Color yellowContent;
  final Color yellowBackground;
  final Color yellowBackgroundLighter;
  final Color bluePrimary;
  final Color skyBluePrimary;
  final Color blueContent;
  final Color blueBackground;
  final Color purpleContent;
  final Color purpleBackground;
  final Color brownContent;
  final Color brownBackground;
  final Color grayContent;
  final Color grayBackground;
  final Color scannerBarcodeIndicator;
  final Color magentaContent;
  final Color magentaBackground;
  final Color pinkContent;
  final Color pinkBackground;
  final Color orangeContent;
  final Color orangeBackground;
  final Color orangePrimary;
  final Color lemonYellowContent;
  final Color lemonYellowBackground;
  final Color lightGreenContent;
  final Color lightGreenBackground;
  final Color aquaContent;
  final Color aquaBackground;
  final Color tealContent;
  final Color tealBackground;
  final Color lavenderContent;
  final Color lavenderBackground;
  final Color blackContent;
  final Color blackBackground;
  final Color blackTagOutline;
  final Color whiteContent;
  final Color whiteBackground;
  final Color whiteTagOutline;

  // ---------------------------------------------------------------------------
  // Marketing
  // ---------------------------------------------------------------------------
  final Color marketingDisabledButton;
  final Color marketingFishbowlBlue;
  final Color marketingDisabledButtonContent;

  // ---------------------------------------------------------------------------
  // Menu
  // ---------------------------------------------------------------------------
  final Color menuBkgdPrimary;
  final Color menuBkgdSecondary;
  final Color menuAccentQuaternary;
  final Color menuContentPrimary;
  final Color menuContentSecondary;
  final Color menuBkgdOutline;
  final Color menuBkgdHighlight;

  const DynamicColors({
    // Background
    required this.bkgdBehindCard,
    required this.bkgdPrimary,
    required this.bkgdOne,
    required this.bkgdSecondary,
    required this.bkgdPrimaryBlue,
    required this.bkgdPrimaryAccentBlue,
    required this.bkgdSecondaryBlue,
    required this.bkgdTertiary,
    required this.bkgdQuaternary,
    required this.bkgdHighlightRowBlue,
    required this.bkgdTabActive,
    required this.bkgdReverse,
    // Content
    required this.contentPrimary,
    required this.contentPrimaryBlue,
    required this.contentPrimaryAccentBlue,
    required this.contentSecondary,
    required this.contentSecondaryBlue,
    required this.contentTertiary,
    required this.contentLinkBlue,
    required this.contentWhite,
    // Color (Semantic / Status)
    required this.redPrimary,
    required this.redSecondary,
    required this.redContent,
    required this.redBackground,
    required this.redBackgroundLighter,
    required this.greenPrimary,
    required this.greenBackground,
    required this.greenBackgroundLighter,
    required this.greenContent,
    required this.yellowPrimary,
    required this.yellowContent,
    required this.yellowBackground,
    required this.yellowBackgroundLighter,
    required this.bluePrimary,
    required this.skyBluePrimary,
    required this.blueContent,
    required this.blueBackground,
    required this.purpleContent,
    required this.purpleBackground,
    required this.brownContent,
    required this.brownBackground,
    required this.grayContent,
    required this.grayBackground,
    required this.scannerBarcodeIndicator,
    required this.magentaContent,
    required this.magentaBackground,
    required this.pinkContent,
    required this.pinkBackground,
    required this.orangeContent,
    required this.orangeBackground,
    required this.orangePrimary,
    required this.lemonYellowContent,
    required this.lemonYellowBackground,
    required this.lightGreenContent,
    required this.lightGreenBackground,
    required this.aquaContent,
    required this.aquaBackground,
    required this.tealContent,
    required this.tealBackground,
    required this.lavenderContent,
    required this.lavenderBackground,
    required this.blackContent,
    required this.blackBackground,
    required this.blackTagOutline,
    required this.whiteContent,
    required this.whiteBackground,
    required this.whiteTagOutline,
    // Marketing
    required this.marketingDisabledButton,
    required this.marketingFishbowlBlue,
    required this.marketingDisabledButtonContent,
    // Menu
    required this.menuBkgdPrimary,
    required this.menuBkgdSecondary,
    required this.menuAccentQuaternary,
    required this.menuContentPrimary,
    required this.menuContentSecondary,
    required this.menuBkgdOutline,
    required this.menuBkgdHighlight,
  });

  @override
  DynamicColors copyWith({
    // Background
    Color? bkgdBehindCard,
    Color? bkgdPrimary,
    Color? bkgdOne,
    Color? bkgdSecondary,
    Color? bkgdPrimaryBlue,
    Color? bkgdPrimaryAccentBlue,
    Color? bkgdSecondaryBlue,
    Color? bkgdTertiary,
    Color? bkgdQuaternary,
    Color? bkgdHighlightRowBlue,
    Color? bkgdTabActive,
    Color? bkgdReverse,
    // Content
    Color? contentPrimary,
    Color? contentPrimaryBlue,
    Color? contentPrimaryAccentBlue,
    Color? contentSecondary,
    Color? contentSecondaryBlue,
    Color? contentTertiary,
    Color? contentLinkBlue,
    Color? contentWhite,
    // Color (Semantic / Status)
    Color? redPrimary,
    Color? redSecondary,
    Color? redContent,
    Color? redBackground,
    Color? redBackgroundLighter,
    Color? greenPrimary,
    Color? greenBackground,
    Color? greenBackgroundLighter,
    Color? greenContent,
    Color? yellowPrimary,
    Color? yellowContent,
    Color? yellowBackground,
    Color? yellowBackgroundLighter,
    Color? bluePrimary,
    Color? skyBluePrimary,
    Color? blueContent,
    Color? blueBackground,
    Color? purpleContent,
    Color? purpleBackground,
    Color? brownContent,
    Color? brownBackground,
    Color? grayContent,
    Color? grayBackground,
    Color? scannerBarcodeIndicator,
    Color? magentaContent,
    Color? magentaBackground,
    Color? pinkContent,
    Color? pinkBackground,
    Color? orangeContent,
    Color? orangeBackground,
    Color? orangePrimary,
    Color? lemonYellowContent,
    Color? lemonYellowBackground,
    Color? lightGreenContent,
    Color? lightGreenBackground,
    Color? aquaContent,
    Color? aquaBackground,
    Color? tealContent,
    Color? tealBackground,
    Color? lavenderContent,
    Color? lavenderBackground,
    Color? blackContent,
    Color? blackBackground,
    Color? blackTagOutline,
    Color? whiteContent,
    Color? whiteBackground,
    Color? whiteTagOutline,
    // Marketing
    Color? marketingDisabledButton,
    Color? marketingFishbowlBlue,
    Color? marketingDisabledButtonContent,
    // Menu
    Color? menuBkgdPrimary,
    Color? menuBkgdSecondary,
    Color? menuAccentQuaternary,
    Color? menuContentPrimary,
    Color? menuContentSecondary,
    Color? menuBkgdOutline,
    Color? menuBkgdHighlight,
  }) {
    return DynamicColors(
      // Background
      bkgdBehindCard: bkgdBehindCard ?? this.bkgdBehindCard,
      bkgdPrimary: bkgdPrimary ?? this.bkgdPrimary,
      bkgdOne: bkgdOne ?? this.bkgdOne,
      bkgdSecondary: bkgdSecondary ?? this.bkgdSecondary,
      bkgdPrimaryBlue: bkgdPrimaryBlue ?? this.bkgdPrimaryBlue,
      bkgdPrimaryAccentBlue:
          bkgdPrimaryAccentBlue ?? this.bkgdPrimaryAccentBlue,
      bkgdSecondaryBlue: bkgdSecondaryBlue ?? this.bkgdSecondaryBlue,
      bkgdTertiary: bkgdTertiary ?? this.bkgdTertiary,
      bkgdQuaternary: bkgdQuaternary ?? this.bkgdQuaternary,
      bkgdHighlightRowBlue: bkgdHighlightRowBlue ?? this.bkgdHighlightRowBlue,
      bkgdTabActive: bkgdTabActive ?? this.bkgdTabActive,
      bkgdReverse: bkgdReverse ?? this.bkgdReverse,
      // Content
      contentPrimary: contentPrimary ?? this.contentPrimary,
      contentPrimaryBlue: contentPrimaryBlue ?? this.contentPrimaryBlue,
      contentPrimaryAccentBlue:
          contentPrimaryAccentBlue ?? this.contentPrimaryAccentBlue,
      contentSecondary: contentSecondary ?? this.contentSecondary,
      contentSecondaryBlue: contentSecondaryBlue ?? this.contentSecondaryBlue,
      contentTertiary: contentTertiary ?? this.contentTertiary,
      contentLinkBlue: contentLinkBlue ?? this.contentLinkBlue,
      contentWhite: contentWhite ?? this.contentWhite,
      // Color (Semantic / Status)
      redPrimary: redPrimary ?? this.redPrimary,
      redSecondary: redSecondary ?? this.redSecondary,
      redContent: redContent ?? this.redContent,
      redBackground: redBackground ?? this.redBackground,
      redBackgroundLighter: redBackgroundLighter ?? this.redBackgroundLighter,
      greenPrimary: greenPrimary ?? this.greenPrimary,
      greenBackground: greenBackground ?? this.greenBackground,
      greenBackgroundLighter:
          greenBackgroundLighter ?? this.greenBackgroundLighter,
      greenContent: greenContent ?? this.greenContent,
      yellowPrimary: yellowPrimary ?? this.yellowPrimary,
      yellowContent: yellowContent ?? this.yellowContent,
      yellowBackground: yellowBackground ?? this.yellowBackground,
      yellowBackgroundLighter:
          yellowBackgroundLighter ?? this.yellowBackgroundLighter,
      bluePrimary: bluePrimary ?? this.bluePrimary,
      skyBluePrimary: skyBluePrimary ?? this.skyBluePrimary,
      blueContent: blueContent ?? this.blueContent,
      blueBackground: blueBackground ?? this.blueBackground,
      purpleContent: purpleContent ?? this.purpleContent,
      purpleBackground: purpleBackground ?? this.purpleBackground,
      brownContent: brownContent ?? this.brownContent,
      brownBackground: brownBackground ?? this.brownBackground,
      grayContent: grayContent ?? this.grayContent,
      grayBackground: grayBackground ?? this.grayBackground,
      scannerBarcodeIndicator:
          scannerBarcodeIndicator ?? this.scannerBarcodeIndicator,
      magentaContent: magentaContent ?? this.magentaContent,
      magentaBackground: magentaBackground ?? this.magentaBackground,
      pinkContent: pinkContent ?? this.pinkContent,
      pinkBackground: pinkBackground ?? this.pinkBackground,
      orangeContent: orangeContent ?? this.orangeContent,
      orangeBackground: orangeBackground ?? this.orangeBackground,
      orangePrimary: orangePrimary ?? this.orangePrimary,
      lemonYellowContent: lemonYellowContent ?? this.lemonYellowContent,
      lemonYellowBackground:
          lemonYellowBackground ?? this.lemonYellowBackground,
      lightGreenContent: lightGreenContent ?? this.lightGreenContent,
      lightGreenBackground: lightGreenBackground ?? this.lightGreenBackground,
      aquaContent: aquaContent ?? this.aquaContent,
      aquaBackground: aquaBackground ?? this.aquaBackground,
      tealContent: tealContent ?? this.tealContent,
      tealBackground: tealBackground ?? this.tealBackground,
      lavenderContent: lavenderContent ?? this.lavenderContent,
      lavenderBackground: lavenderBackground ?? this.lavenderBackground,
      blackContent: blackContent ?? this.blackContent,
      blackBackground: blackBackground ?? this.blackBackground,
      blackTagOutline: blackTagOutline ?? this.blackTagOutline,
      whiteContent: whiteContent ?? this.whiteContent,
      whiteBackground: whiteBackground ?? this.whiteBackground,
      whiteTagOutline: whiteTagOutline ?? this.whiteTagOutline,
      // Marketing
      marketingDisabledButton:
          marketingDisabledButton ?? this.marketingDisabledButton,
      marketingFishbowlBlue:
          marketingFishbowlBlue ?? this.marketingFishbowlBlue,
      marketingDisabledButtonContent:
          marketingDisabledButtonContent ?? this.marketingDisabledButtonContent,
      // Menu
      menuBkgdPrimary: menuBkgdPrimary ?? this.menuBkgdPrimary,
      menuBkgdSecondary: menuBkgdSecondary ?? this.menuBkgdSecondary,
      menuAccentQuaternary: menuAccentQuaternary ?? this.menuAccentQuaternary,
      menuContentPrimary: menuContentPrimary ?? this.menuContentPrimary,
      menuContentSecondary: menuContentSecondary ?? this.menuContentSecondary,
      menuBkgdOutline: menuBkgdOutline ?? this.menuBkgdOutline,
      menuBkgdHighlight: menuBkgdHighlight ?? this.menuBkgdHighlight,
    );
  }

  @override
  DynamicColors lerp(ThemeExtension<DynamicColors>? other, double t) {
    if (other is! DynamicColors) {
      return this;
    }
    return DynamicColors(
      // Background
      bkgdBehindCard:
          Color.lerp(bkgdBehindCard, other.bkgdBehindCard, t) ?? bkgdBehindCard,
      bkgdPrimary: Color.lerp(bkgdPrimary, other.bkgdPrimary, t) ?? bkgdPrimary,
      bkgdOne: Color.lerp(bkgdOne, other.bkgdOne, t) ?? bkgdOne,
      bkgdSecondary:
          Color.lerp(bkgdSecondary, other.bkgdSecondary, t) ?? bkgdSecondary,
      bkgdPrimaryBlue:
          Color.lerp(bkgdPrimaryBlue, other.bkgdPrimaryBlue, t) ??
          bkgdPrimaryBlue,
      bkgdPrimaryAccentBlue:
          Color.lerp(bkgdPrimaryAccentBlue, other.bkgdPrimaryAccentBlue, t) ??
          bkgdPrimaryAccentBlue,
      bkgdSecondaryBlue:
          Color.lerp(bkgdSecondaryBlue, other.bkgdSecondaryBlue, t) ??
          bkgdSecondaryBlue,
      bkgdTertiary:
          Color.lerp(bkgdTertiary, other.bkgdTertiary, t) ?? bkgdTertiary,
      bkgdQuaternary:
          Color.lerp(bkgdQuaternary, other.bkgdQuaternary, t) ?? bkgdQuaternary,
      bkgdHighlightRowBlue:
          Color.lerp(bkgdHighlightRowBlue, other.bkgdHighlightRowBlue, t) ??
          bkgdHighlightRowBlue,
      bkgdTabActive:
          Color.lerp(bkgdTabActive, other.bkgdTabActive, t) ?? bkgdTabActive,
      bkgdReverse: Color.lerp(bkgdReverse, other.bkgdReverse, t) ?? bkgdReverse,
      // Content
      contentPrimary:
          Color.lerp(contentPrimary, other.contentPrimary, t) ?? contentPrimary,
      contentPrimaryBlue:
          Color.lerp(contentPrimaryBlue, other.contentPrimaryBlue, t) ??
          contentPrimaryBlue,
      contentPrimaryAccentBlue:
          Color.lerp(
            contentPrimaryAccentBlue,
            other.contentPrimaryAccentBlue,
            t,
          ) ??
          contentPrimaryAccentBlue,
      contentSecondary:
          Color.lerp(contentSecondary, other.contentSecondary, t) ??
          contentSecondary,
      contentSecondaryBlue:
          Color.lerp(contentSecondaryBlue, other.contentSecondaryBlue, t) ??
          contentSecondaryBlue,
      contentTertiary:
          Color.lerp(contentTertiary, other.contentTertiary, t) ??
          contentTertiary,
      contentLinkBlue:
          Color.lerp(contentLinkBlue, other.contentLinkBlue, t) ??
          contentLinkBlue,
      contentWhite:
          Color.lerp(contentWhite, other.contentWhite, t) ?? contentWhite,
      // Color (Semantic / Status)
      redPrimary: Color.lerp(redPrimary, other.redPrimary, t) ?? redPrimary,
      redSecondary:
          Color.lerp(redSecondary, other.redSecondary, t) ?? redSecondary,
      redContent: Color.lerp(redContent, other.redContent, t) ?? redContent,
      redBackground:
          Color.lerp(redBackground, other.redBackground, t) ?? redBackground,
      redBackgroundLighter:
          Color.lerp(redBackgroundLighter, other.redBackgroundLighter, t) ??
          redBackgroundLighter,
      greenPrimary:
          Color.lerp(greenPrimary, other.greenPrimary, t) ?? greenPrimary,
      greenBackground:
          Color.lerp(greenBackground, other.greenBackground, t) ??
          greenBackground,
      greenBackgroundLighter:
          Color.lerp(greenBackgroundLighter, other.greenBackgroundLighter, t) ??
          greenBackgroundLighter,
      greenContent:
          Color.lerp(greenContent, other.greenContent, t) ?? greenContent,
      yellowPrimary:
          Color.lerp(yellowPrimary, other.yellowPrimary, t) ?? yellowPrimary,
      yellowContent:
          Color.lerp(yellowContent, other.yellowContent, t) ?? yellowContent,
      yellowBackground:
          Color.lerp(yellowBackground, other.yellowBackground, t) ??
          yellowBackground,
      yellowBackgroundLighter:
          Color.lerp(
            yellowBackgroundLighter,
            other.yellowBackgroundLighter,
            t,
          ) ??
          yellowBackgroundLighter,
      bluePrimary: Color.lerp(bluePrimary, other.bluePrimary, t) ?? bluePrimary,
      skyBluePrimary:
          Color.lerp(skyBluePrimary, other.skyBluePrimary, t) ?? skyBluePrimary,
      blueContent: Color.lerp(blueContent, other.blueContent, t) ?? blueContent,
      blueBackground:
          Color.lerp(blueBackground, other.blueBackground, t) ?? blueBackground,
      purpleContent:
          Color.lerp(purpleContent, other.purpleContent, t) ?? purpleContent,
      purpleBackground:
          Color.lerp(purpleBackground, other.purpleBackground, t) ??
          purpleBackground,
      brownContent:
          Color.lerp(brownContent, other.brownContent, t) ?? brownContent,
      brownBackground:
          Color.lerp(brownBackground, other.brownBackground, t) ??
          brownBackground,
      grayContent: Color.lerp(grayContent, other.grayContent, t) ?? grayContent,
      grayBackground:
          Color.lerp(grayBackground, other.grayBackground, t) ?? grayBackground,
      scannerBarcodeIndicator:
          Color.lerp(
            scannerBarcodeIndicator,
            other.scannerBarcodeIndicator,
            t,
          ) ??
          scannerBarcodeIndicator,
      magentaContent:
          Color.lerp(magentaContent, other.magentaContent, t) ?? magentaContent,
      magentaBackground:
          Color.lerp(magentaBackground, other.magentaBackground, t) ??
          magentaBackground,
      pinkContent: Color.lerp(pinkContent, other.pinkContent, t) ?? pinkContent,
      pinkBackground:
          Color.lerp(pinkBackground, other.pinkBackground, t) ?? pinkBackground,
      orangeContent:
          Color.lerp(orangeContent, other.orangeContent, t) ?? orangeContent,
      orangeBackground:
          Color.lerp(orangeBackground, other.orangeBackground, t) ??
          orangeBackground,
      orangePrimary:
          Color.lerp(orangePrimary, other.orangePrimary, t) ?? orangePrimary,
      lemonYellowContent:
          Color.lerp(lemonYellowContent, other.lemonYellowContent, t) ??
          lemonYellowContent,
      lemonYellowBackground:
          Color.lerp(lemonYellowBackground, other.lemonYellowBackground, t) ??
          lemonYellowBackground,
      lightGreenContent:
          Color.lerp(lightGreenContent, other.lightGreenContent, t) ??
          lightGreenContent,
      lightGreenBackground:
          Color.lerp(lightGreenBackground, other.lightGreenBackground, t) ??
          lightGreenBackground,
      aquaContent: Color.lerp(aquaContent, other.aquaContent, t) ?? aquaContent,
      aquaBackground:
          Color.lerp(aquaBackground, other.aquaBackground, t) ?? aquaBackground,
      tealContent: Color.lerp(tealContent, other.tealContent, t) ?? tealContent,
      tealBackground:
          Color.lerp(tealBackground, other.tealBackground, t) ?? tealBackground,
      lavenderContent:
          Color.lerp(lavenderContent, other.lavenderContent, t) ??
          lavenderContent,
      lavenderBackground:
          Color.lerp(lavenderBackground, other.lavenderBackground, t) ??
          lavenderBackground,
      blackContent:
          Color.lerp(blackContent, other.blackContent, t) ?? blackContent,
      blackBackground:
          Color.lerp(blackBackground, other.blackBackground, t) ??
          blackBackground,
      blackTagOutline:
          Color.lerp(blackTagOutline, other.blackTagOutline, t) ??
          blackTagOutline,
      whiteContent:
          Color.lerp(whiteContent, other.whiteContent, t) ?? whiteContent,
      whiteBackground:
          Color.lerp(whiteBackground, other.whiteBackground, t) ??
          whiteBackground,
      whiteTagOutline:
          Color.lerp(whiteTagOutline, other.whiteTagOutline, t) ??
          whiteTagOutline,
      // Marketing
      marketingDisabledButton:
          Color.lerp(
            marketingDisabledButton,
            other.marketingDisabledButton,
            t,
          ) ??
          marketingDisabledButton,
      marketingFishbowlBlue:
          Color.lerp(marketingFishbowlBlue, other.marketingFishbowlBlue, t) ??
          marketingFishbowlBlue,
      marketingDisabledButtonContent:
          Color.lerp(
            marketingDisabledButtonContent,
            other.marketingDisabledButtonContent,
            t,
          ) ??
          marketingDisabledButtonContent,
      // Menu
      menuBkgdPrimary:
          Color.lerp(menuBkgdPrimary, other.menuBkgdPrimary, t) ??
          menuBkgdPrimary,
      menuBkgdSecondary:
          Color.lerp(menuBkgdSecondary, other.menuBkgdSecondary, t) ??
          menuBkgdSecondary,
      menuAccentQuaternary:
          Color.lerp(menuAccentQuaternary, other.menuAccentQuaternary, t) ??
          menuAccentQuaternary,
      menuContentPrimary:
          Color.lerp(menuContentPrimary, other.menuContentPrimary, t) ??
          menuContentPrimary,
      menuContentSecondary:
          Color.lerp(menuContentSecondary, other.menuContentSecondary, t) ??
          menuContentSecondary,
      menuBkgdOutline:
          Color.lerp(menuBkgdOutline, other.menuBkgdOutline, t) ??
          menuBkgdOutline,
      menuBkgdHighlight:
          Color.lerp(menuBkgdHighlight, other.menuBkgdHighlight, t) ??
          menuBkgdHighlight,
    );
  }
}
