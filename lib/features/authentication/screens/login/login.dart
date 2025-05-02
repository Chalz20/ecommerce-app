import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/login/login_controller.dart';
import '../password_configuration/forget_password.dart';
import '../signup/signup.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

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
                    key: controller.loginFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                      child: Column(
                        children: [
                        /// Email
                          TextFormField(
                            controller: controller.email,
                            validator: (value) => TValidator.validateEmail(value),
                            decoration: const InputDecoration(
                              hintText: TTexts.email,
                              prefixIcon: Icon(Iconsax.direct_right)
                            )
                           ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                        /// Password
                          Obx(
                                () => TextFormField(
                                controller: controller.password,
                                validator: (value) => TValidator.validateEmpty('Password', value),
                                obscureText: controller.hidePassword.value,
                                obscuringCharacter: '*',
                                decoration:  InputDecoration(
                                    hintText: TTexts.password,
                                    prefixIcon: const Icon(Iconsax.password_check),
                                    suffixIcon: IconButton(
                                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                        icon: Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye)
                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields/2),

                          /// Remember and forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Remember Me
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: controller.rememberMe.value,
                                      onChanged: (value) {
                                        controller.rememberMe.value = !controller.rememberMe.value;
                                      },
                                                                     ),
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
                          SizedBox( width: double.infinity , child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn() , child: const Text(TTexts.signIn))),
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




