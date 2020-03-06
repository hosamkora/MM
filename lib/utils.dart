import 'dart:math' show Random;

import 'package:flutter/widgets.dart';

extension BorderContainer on Widget {
  Widget get border => Container(
        child: this,
        decoration: BoxDecoration(
          border: Border.all(color: randColor, width: 5),
        ),
      );
}

Color get randColor {
  final r = Random().nextInt(256);
  final g = Random().nextInt(256);
  final b = Random().nextInt(256);
  final opacity = 1.0;
  return Color.fromRGBO(r, g, b, opacity);
}
