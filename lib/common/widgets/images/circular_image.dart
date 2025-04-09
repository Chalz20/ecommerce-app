import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    required this.image,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor, this.overlayColor,
  });

  final double width, height, padding;
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;
  final Color? backgroundColor, overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
          //If image background color is null then switch to light and dark mode color design
          color: backgroundColor ?? ( THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white ),
          borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor
        ),
      ),
    );
  }
}
