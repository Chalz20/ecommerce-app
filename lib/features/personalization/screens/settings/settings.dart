import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         child: Column(
            children: [
              ///Header
              PrimaryHeaderContainer(
                  height: 220,
                  child: Column(
                    children: [
                      ///AppBar
                      TAppBar(
                        title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply( color: TColors.white),),
                      ),


                      ///UserProfile Card
                        UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()) ,),

                     // const SizedBox(height: TSizes.spaceBtwSections),
                    ]
                  )
              ),

              ///Body
               Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ///Account Settings
                      const SectionHeading(
                          title: 'Account Settings', showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      SettingsMenuTile(
                          title: 'My Addresses',
                          subtitle: 'Set shopping delivery address',
                          icon: Iconsax.safe_home,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'My Cart',
                          subtitle: 'Add, remove products and move to checkout ',
                          icon: Iconsax.shopping_cart,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'My Orders',
                          subtitle: 'List of all pending and completed orders ',
                          icon: Iconsax.bag_tick,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'Bank Account',
                          subtitle: 'Withdraw money from your account',
                          icon: Iconsax.bank,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'My Coupons',
                          subtitle: 'List of all coupons and discounts',
                          icon: Iconsax.discount_shape,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'Notifications',
                          subtitle: 'Set any kind of notification message',
                          icon: Iconsax.notification,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'Account Privacy',
                          subtitle: 'Manage data usage and connected accounts',
                          icon: Iconsax.discount_shape,
                          onTap: () {}
                      ),

                      ///App Settings
                      const SizedBox(height: TSizes.spaceBtwSections,),
                      const SectionHeading(
                        title: 'App Settings', showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      SettingsMenuTile(
                          title: 'Load Data',
                          subtitle: 'Upload data to your firebase cloud',
                          icon: Iconsax.document_upload,
                          onTap: () {}
                      ),

                      SettingsMenuTile(
                          title: 'Geolocation',
                          subtitle: 'Set recommendation based on location',
                          icon: Iconsax.location,
                          onTap: () {},
                          trailing: Switch(value: true, onChanged: (value) {}),
                      ),

                      SettingsMenuTile(
                        title: 'Safe mode',
                        subtitle: 'Search in safe mode',
                        icon: Iconsax.security_user,
                        onTap: () {},
                        trailing: Switch(value: false, onChanged: (value) {}),
                      ),

                      SettingsMenuTile(
                        title: 'HD Image quality',
                        subtitle: 'Set the image quality',
                        icon: Iconsax.image,
                        onTap: () {},
                        trailing: Switch(value: false, onChanged: (value) {}),
                      ),

                      ///Logout Button
                      const SizedBox( height: TSizes.spaceBtwSections,),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: (){},
                            child: const Text('Logout')
                        ),
                      ),
                      const SizedBox( height: TSizes.spaceBtwSections ),


                    ],
                  ),

              )
            ]
         ),
      ),
    );
  }
}


