import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/circular_icon.dart';
import '../../images/t_rounded_images.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    ///Container with side padding, edges , radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color:  dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
           /// Thumbnail , Wishlist button and discount tag
          children: [
             RoundedContainer(
               height: 180,
               padding: const EdgeInsets.all(TSizes.sm),
               backgroundColor: dark ? TColors.dark : TColors.light,
               child: Stack(
                 children: [
                   /// Thumbnail Image
                   const TRoundedImage(imageUrl: TImages.productImage1,),

                   /// Discount Tag
                   Positioned(
                     top:12,
                     left: 2,
                     child: RoundedContainer(
                       borderRadius: TSizes.sm,
                       backgroundColor: TColors.secondary.withOpacity(0.8),
                       padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                       child:  Text('20%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                     ),
                     ),
                   ),

                   /// Wishlist Button
                   const Positioned(
                       top: 2,
                       right: 0,
                       child: CircularIcon(icon: Iconsax.heart5, color: Colors.red,)
                   )
                 ]
               ),
             ),
            const SizedBox(height: TSizes.spaceBtwItems/2),

            ///Details
              Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      const ProductTitleText(title: 'Green Nike shoes' , smallSize: true,),
                      const SizedBox(height: TSizes.spaceBtwItems/2),
                      BrandTitleWithVerifiedIcon(
                        title: 'Nike',
                      ),


                  ],
                ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                const Padding(
                  padding:  EdgeInsets.only(left: TSizes.sm),
                  child:  ProductPriceText(price: '100'),
                ),

                Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                    )
                )

              ],
            )
      ]
      )
      ),
    );
  }
}




