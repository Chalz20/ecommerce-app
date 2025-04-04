import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/t_promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/products_cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
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
                           HomeCategories()

                         ],
                  )
                  )

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

                  SizedBox(height: TSizes.spaceBtwSections,),

                  ///Popular Products
                  ProductCardVertical(),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}














