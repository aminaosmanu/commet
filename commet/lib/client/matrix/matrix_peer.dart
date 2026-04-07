import 'package:tiamat/config/style/vantosh_colors.dart';
import 'package:commet/client/client.dart';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as matrix;

class MatrixPeer implements Peer {
  late matrix.User matrixUser;

  @override
  ImageProvider<Object>? avatar;

  @override
  String? detail;

  @override
  String get displayName => matrixUser.calcDisplayname();

  @override
  String get identifier => matrixUser.id;

  @override
  String get userName => matrixUser.id;

  MatrixPeer(this.matrixUser);

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

  @override
  Color get defaultColor => hashColor(identifier);
}
