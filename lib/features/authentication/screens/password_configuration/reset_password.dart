import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
    required this.email
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(

              children: [
                 ///Image with 60% of screen width
                Image(
                  image: const  AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth() * 0.6 ,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Title and subtitle
                Text(
                  email,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                Text(
                  TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),


                ///Buttons
                SizedBox(
                    width: double.infinity ,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()) ,
                        child: const Text(TTexts.done)
                    )
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                    width: double.infinity ,
                    child: TextButton(
                        onPressed: () => ForgetPasswordController.instance.resendResetPasswordEmail(email) ,
                        child: const Text(TTexts.resendEmail)
                    )
                ),

              ],
            ),
        ),
      ),
    );
  }
}
