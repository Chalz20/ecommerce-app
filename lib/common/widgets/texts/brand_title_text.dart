import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.color,
    this.brandTextSize = TextSizes.small,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final Color? color;
  final TextSizes brandTextSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      // Set the text size according to the brandsize
        style: brandTextSize == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                : Theme.of(context).textTheme.bodyMedium!.apply(color: color)

    );
  }
}
