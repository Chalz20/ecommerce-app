import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.backgroundColor = TColors.white,
    this.padding = 0,
    this.child,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final double padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: TColors.textWhite.withOpacity(0.1),
            borderRadius: BorderRadius.circular(400)
        )

    );
  }
}
