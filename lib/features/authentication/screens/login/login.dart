import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../password_configuration/forget_password.dart';
import '../signup/signup.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                /// Logo , title and
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage( dark ? TImages.lightAppLogo : TImages.darkAppLogo ),
                      height: 150,
                    ),
                    Text(
                      TTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(
                      TTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                //Form
                Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                      child: Column(
                        children: [
                        /// Email
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: TTexts.email,
                              prefixIcon: Icon(Iconsax.direct_right)
                            )
                           ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                        /// Password
                          TextFormField(
                              decoration: const InputDecoration(
                                  hintText: TTexts.password,
                                  prefixIcon: Icon(Iconsax.password_check),
                                  suffixIcon: Icon(Iconsax.eye_slash)
                              )
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields/2),

                          /// Remember and forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Remember Me
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                 ),
                                  const Text(TTexts.rememberMe)
                                ],
                              ),

                              ///Forgot Password
                              TextButton(
                                onPressed: () => Get.to(() => const ForgetPassword()),
                                child: const Text(TTexts.forgetPassword),
                              )
                            ]
                          ),

                          const SizedBox(height: TSizes.spaceBtwSections),

                          ///Sign In Button
                          SizedBox( width: double.infinity , child: ElevatedButton(onPressed: ()=>Get.to(() => const NavigationMenu()) , child: const Text(TTexts.signIn))),
                          const SizedBox(height: TSizes.spaceBtwItems,),

                          ///Create Account Button
                          SizedBox(
                              width: double.infinity ,
                              child: ElevatedButton(
                                  onPressed: (){
                                    Get.to(() => const SignupScreen());
                                  } ,
                                  child: const Text(TTexts.createAccount))),

                                       ],
                                     ),
                    ),
             ),

                ///Divider
                FormDivider(dark: dark , dividerText: TTexts.orSignInWith.capitalize!
                  ,),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Footer
                SocialButtons(dark: dark)
            ]
          )
        )
    )
    );
  }
}




