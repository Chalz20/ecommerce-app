import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tab_bar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/brands/brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
      
                        GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard();
                          },
                        )
      
                      ],
                    )
                ),
      
                /// Tabs
                bottom: const TTabBar(tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Clothing')),
                  Tab(child: Text('Shoes')),
                  Tab(child: Text('Bags')),
                  Tab(child: Text('Furniture')),
                ])
      
              )
            ];
          },

              ///Body
              body: const TabBarView(
                children: [
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab(),
                  CategoryTab(),
                ],

              )
          )
      ),
    );
  }
}

