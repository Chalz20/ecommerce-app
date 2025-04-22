import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
        'Profile',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      ),

        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace,),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ///Profile Picture
                      const CircularImage(
                          image: TImages.user,
                          width: 80,
                          height: 80,
                      ),
                      TextButton(
                          onPressed: (){} ,
                          child: const Text('Change Profile Picture')
                      ),
                    ]
                  ),
                ),

                ///Details
                const SizedBox(height: TSizes.spaceBtwItems/2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                
                const SectionHeading(title: 'Profile Information', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),

                ///Profile Menu
                ProfileMenu( title: 'Name', value: 'Charles Leonard', onTap: (){}),
                ProfileMenu( title: 'Username', value: 'chalz', onTap: (){}),

                ///Heading persona info
                const SizedBox(height: TSizes.spaceBtwItems/2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const SectionHeading(title: 'Personal Information', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),

                ProfileMenu( title: 'User ID', value: '4563', icon: Iconsax.copy, onTap: (){}),
                ProfileMenu( title: 'Email', value: 'clkadete@gmail.com', onTap: (){}),
                ProfileMenu( title: 'Phone Number', value: '+25545098782', onTap: (){}),
                ProfileMenu( title: 'Gender', value: 'Male', onTap: (){}),
                ProfileMenu( title: 'Date of Birth', value: '10 Oct 1990', onTap: (){}),

                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),

                Center(
                  child: TextButton(
                    onPressed: (){},
                    child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
                  ),
                )




              ],
            ),

          ),

        )
    );
  }
}


