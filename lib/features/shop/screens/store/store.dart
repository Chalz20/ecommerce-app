import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CounterIcon( onPressed: () {} )
        ],
      ),
        body: NestedScrollView( headerSliverBuilder: (_, innerBoxIsScrollable){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 440,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              flexibleSpace: Padding(
                  padding:  const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      ///SearchBar
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      const SearchContainer(text: 'Search in store', showBackground: false, padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwSections,),

                      /// Featured Brands
                      const SectionHeading(title: 'Featured Brands'),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5 ),

                      RoundedContainer(
                        padding: const EdgeInsets.all(TSizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            ///Icon
                            CircularImage(
                              image: TImages.clothIcon,
                              backgroundColor: Colors.transparent,
                              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                            ),

                            /// Text
                            Column(

                            )

                          ]
                        ),

                      )


                    ],
                  )
              ),

            )
          ];
        },

            body: Container()
        )
    );
  }
}

