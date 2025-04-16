import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../widgets/custom_shapes/containers/rounded_container.dart';
import '../widgets/images/circular_image.dart';
import '../widgets/texts/brand_title_with_verified_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.showBorder = true
  });

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
            children: [
              ///Icon
              Flexible(
                child: CircularImage(
                  image: TImages.clothIcon,
                  backgroundColor: Colors.transparent,
                  overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),

              /// Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrandTitleWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSize: TextSizes.large,
                    ),
                    Text(
                      '256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              )

            ]
        ),

      ),
    );
  }
}
