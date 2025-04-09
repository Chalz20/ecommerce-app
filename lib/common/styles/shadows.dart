import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    spreadRadius: 10,
    blurRadius: 7,
    offset: const Offset(0, 2), // changes position of shadow
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    spreadRadius: 50,
    blurRadius: 7,
    offset: const Offset(2, 0), // changes position of shadow
  );

}