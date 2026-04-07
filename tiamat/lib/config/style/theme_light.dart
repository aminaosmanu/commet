import 'package:tiamat/config/style/theme_base.dart';
import 'package:tiamat/config/style/theme_common.dart';
import 'package:tiamat/config/style/theme_extensions.dart';
import 'package:tiamat/config/style/vantosh_colors.dart';
import 'package:flutter/material.dart';

class ThemeLightColors {
  static const Color surfaceHigh1 = Color.fromARGB(255, 245, 245, 245);
  static const Color primary = VantoshColors.primary;
  static const Color surface = Color.fromARGB(255, 245, 250, 251);
  static const Color surfaceContainer = Color.fromARGB(255, 233, 239, 240);
  static const Color surfaceContainerLow = Color.fromARGB(255, 239, 245, 246);
  static const Color surfaceContainerLowest =
      Color.fromARGB(255, 255, 255, 255);
  static const Color surfaceContainerHigh = Color.fromARGB(255, 227, 233, 234);
  static const Color surfaceContainerHighest =
      Color.fromARGB(255, 222, 227, 229);

  static const Color secondary = VantoshColors.secondary;
  static const Color surfaceLow1 = Color.fromARGB(255, 245, 245, 245);
  static const Color surfaceLow2 = Color.fromARGB(255, 240, 240, 240);
  static const Color surfaceLow3 = Color.fromARGB(255, 235, 235, 235);
  static const Color surfaceLow4 = Color.fromARGB(255, 230, 230, 230);
  static const Color highlightColor = Colors.white30;
  static const Color onSurface = VantoshColors.textPrimary;
  static const Color outlineColor = Color.fromARGB(48, 92, 92, 92);
}

class ThemeLight {
  static ThemeData get theme {
    var scheme = ColorScheme.fromSeed(
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        seedColor: VantoshColors.primary,
        brightness: Brightness.light,
        primaryContainer: ThemeLightColors.primary,
        onPrimaryContainer: Colors.white,
        outline: Colors.white,
        primary: ThemeLightColors.primary);

    return ThemeBase.theme(scheme).copyWith(extensions: [
      const ThemeSettings(),
      FoundationSettings(color: scheme.surfaceDim),
      const ExtraColors(
          codeHighlight: VantoshColors.secondary,
          linkColor: VantoshColors.primary)
    ]);
  }
}
