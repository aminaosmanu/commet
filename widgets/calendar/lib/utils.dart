import 'package:tiamat/config/style/vantosh_colors.dart';
import 'dart:ui';

class Utils {
  // Matching color calculation that other clients use. Element, Cinny, Etc.
  // https://github.com/cinnyapp/cinny/blob/dev/src/util/colorMXID.js
  static Color hashColor(String userId) {
    int hash = 0;

    const colors = VantoshColors.avatarColors;

    for (int i = 0; i < userId.length; i++) {
      var chr = userId.codeUnitAt(i);
      hash = ((hash << 5) - hash) + chr;
      hash |= 0;
      hash = BigInt.from(hash).toSigned(32).toInt();
    }

    var index = hash.abs() % 8;

    return colors[index];
  }
}
