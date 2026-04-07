import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiamat/config/style/theme_base.dart';
import 'package:tiamat/config/style/theme_common.dart';
import 'package:tiamat/config/style/theme_extensions.dart';
import 'package:tiamat/config/style/vantosh_colors.dart';
import 'dart:io' show Platform;

class ThemeAmoledColors {
  static const Color surfaceHigh1 = Color.fromARGB(255, 30, 30, 30);
  static const Color secondary = VantoshColors.secondary;
  static const Color primary = VantoshColors.primary;
  static const Color surface = Colors.black;
  static const Color surfaceLow1 = Color.fromARGB(255, 10, 10, 10);
  static const Color surfaceLow2 = Color.fromARGB(255, 15, 15, 15);
  static const Color surfaceLow3 = Color.fromARGB(255, 20, 20, 20);
  static const Color surfaceLow4 = Color.fromARGB(255, 25, 25, 25);
  static const Color onSurface = VantoshColors.textLight;
  static const Color highlightColor = Colors.white10;
  static const Color outlineColor = Color.fromARGB(255, 30, 34, 37);
}

class ThemeAmoled {
  static ThemeData get theme => ThemeBase.theme(const ColorScheme(
              primary: VantoshColors.primary,
              secondary: ThemeAmoledColors.secondary,
              secondaryContainer: Color.fromARGB(255, 40, 40, 40),
              surface: ThemeAmoledColors.surface,
              error: Color.fromARGB(255, 255, 124, 124),
              onPrimary: Colors.black,
              onSecondary: ThemeAmoledColors.onSurface,
              onSurface: VantoshColors.textLight,
              onError: Colors.white,
              tertiaryContainer: Colors.black,
              brightness: Brightness.dark,
              outline: ThemeAmoledColors.surfaceHigh1))
          .copyWith(extensions: [
        const ExtraColors(
            codeHighlight: VantoshColors.secondary,
            linkColor: VantoshColors.primary),
        const ThemeSettings(caulkBorders: true, caulkStrokeThickness: 1)
      ]);
}
