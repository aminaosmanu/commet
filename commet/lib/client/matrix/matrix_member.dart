import 'package:tiamat/config/style/vantosh_colors.dart';
import 'package:commet/client/components/user_color/user_color_component.dart';
import 'package:commet/client/matrix/matrix_client.dart';
import 'package:commet/client/matrix/matrix_mxc_image_provider.dart';
import 'package:commet/client/member.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as matrix;

class MatrixMember implements Member {
  matrix.User matrixUser;
  MatrixClient client;

  @override
  ImageProvider<Object>? get avatar => matrixUser.avatarUrl != null
      ? MatrixMxcImage(matrixUser.avatarUrl!, client.matrixClient,
          doThumbnail: true,
          autoLoadFullRes: false,
          doFullres: false,
          thumbnailHeight: 86)
      : null;

  @override
  String? get detail => matrixUser.id.domain;

  @override
  String get displayName => matrixUser.calcDisplayname();

  @override
  String get identifier => matrixUser.id;

  @override
  String get userName => matrixUser.id;

  @override
  String? get avatarId => matrixUser.avatarUrl?.toString();

  MatrixMember(this.client, this.matrixUser);

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
  Color get defaultColor =>
      client.getComponent<UserColorComponent>()?.getColor(identifier) ??
      hashColor(identifier);

  @override
  bool operator ==(Object other) {
    if (other is! MatrixMember) return false;
    if (identical(this, other)) return true;
    return identifier == other.identifier;
  }

  @override
  int get hashCode => identifier.hashCode;
}
