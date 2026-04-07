import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiamat/config/style/theme_base.dart';
import 'package:tiamat/config/style/theme_common.dart';
import 'package:tiamat/config/style/theme_extensions.dart';
import 'package:tiamat/config/style/vantosh_colors.dart';
import 'dart:io' show Platform;

class ThemeDarkColors {
  static const Color surfaceContainerHigh = Color.fromARGB(255, 47, 51, 55);
  static const Color secondary = VantoshColors.secondary;
  static const Color primary = VantoshColors.primary;
  static const Color surface = Color.fromARGB(255, 43, 46, 49);
  static const Color surfaceContainer = Color.fromARGB(255, 38, 41, 44);
  static const Color surfaceContainerLow = Color.fromARGB(255, 30, 34, 37);
  static const Color surfaceLow3 = Color.fromARGB(255, 25, 28, 31);
  static const Color surfaceContainerLowest = Color.fromARGB(255, 19, 21, 22);
  static const Color onSurface = VantoshColors.textLight;
  static const Color highlightColor = Colors.white10;
  static const Color outlineColor = Color.fromARGB(255, 30, 34, 37);
}

class ThemeDark {
  static ThemeData get theme {
    var scheme = ColorScheme.fromSeed(
        seedColor: VantoshColors.primary,
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        primary: VantoshColors.primary,
        onPrimary: Colors.white,
        surface: ThemeDarkColors.surface,
        surfaceContainer: ThemeDarkColors.surfaceContainer,
        surfaceContainerLow: ThemeDarkColors.surfaceContainerLow,
        surfaceContainerLowest: ThemeDarkColors.surfaceContainerLowest,
        primaryContainer: VantoshColors.primary,
        brightness: Brightness.dark,
        outline: ThemeDarkColors.surfaceContainerHigh);

    return ThemeBase.theme(scheme).copyWith(extensions: [
      const ThemeSettings(caulkBorders: true, caulkBorderRadius: 1),
      FoundationSettings(color: scheme.surfaceDim),
      const ExtraColors(
          codeHighlight: VantoshColors.secondary,
          linkColor: VantoshColors.primary)
    ]);
  }
}
