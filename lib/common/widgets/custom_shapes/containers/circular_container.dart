import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height,
    this.radius = 400,
    this.margin,
    this.backgroundColor = TColors.white,
    this.padding = 0,
    this.child,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final double padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(0),
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius)
        )

    );
  }
}
