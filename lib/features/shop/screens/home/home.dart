import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/t_promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              height: 400,
              child: Column(
                children: [
                  ///AppBar
                  HomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  ///SearchBar
                  SearchContainer(text: 'Search in Store', icon: Iconsax.search_normal,),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  ///Popular Categories Scrollable
                  Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                         children: [
                           ///Heading
                           SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: TColors.white,),
                           SizedBox(height: TSizes.spaceBtwItems,),

                           ///Categories
                           HomeCategories(),

                         ],
                  )
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),

                ]
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),


              child: Column(
                children: [
                  ///Promotion Carousel
                  const TPromoSlider(
                    banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  ///Heading
                  const SectionHeading(title: 'Popular Products',),

                  ///Popular Products
                  GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}














