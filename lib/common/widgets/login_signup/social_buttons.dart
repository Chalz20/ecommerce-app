import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: dark ? TColors.darkGrey : TColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () => controller.signInWithGoogle(),
              icon: Image.asset( TImages.google ,  width: TSizes.iconMd, height: TSizes.iconMd,),
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: dark ? TColors.darkGrey : TColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset( TImages.facebook ,  width: TSizes.iconMd, height: TSizes.iconMd,),
            ),
          ),
        ]
    );
  }
}