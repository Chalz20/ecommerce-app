import 'package:flutter/material.dart';

import '../../../../../common/brands/brand_show_case.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brands
              const BrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ///Products
              const SectionHeading(title: 'You might like'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return const ProductCardVertical();
                },
              )
            ],
          ),
        ),
      ]
    );
  }
}
