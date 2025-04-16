import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.iconColor = TColors.primary,
    this.brandTextSize = TextSizes.small,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final Color? textColor, iconColor;
  final TextSizes brandTextSize;
  final TextAlign? textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color:  textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            maxLines: maxLines,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon( Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}
