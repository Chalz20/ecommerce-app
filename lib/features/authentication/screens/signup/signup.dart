import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all( TSizes.defaultSpace),
            child: Column(
              children: [
                ///Title
                Text(TTexts.signupTitle,
                 style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Form
                Form(
                    child: Column(
                      children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                    expands: false,
                                    decoration: const InputDecoration(
                                        hintText: TTexts.firstName,
                                        prefixIcon: Icon(Iconsax.user)
                                    )
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwInputFields),

                              Expanded(
                                child: TextFormField(
                                    expands: false,
                                    decoration: const InputDecoration(
                                        hintText: TTexts.lastName,
                                        prefixIcon: Icon(Iconsax.user)
                                    )
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        ///Username
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: TTexts.username,
                                prefixIcon: Icon(Iconsax.user_edit)
                            )
                        ),

                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        ///email
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: TTexts.email,
                                prefixIcon: Icon(Iconsax.direct)
                            )
                        ),

                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        ///Phone number
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: TTexts.phoneNo,
                                prefixIcon: Icon(Iconsax.call)
                            )
                        ),

                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        ///Password
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: TTexts.password,
                                prefixIcon: Icon(Iconsax.password_check),
                                suffixIcon: Icon(Iconsax.eye_slash)
                            )
                        ),

                        ///Terms and conditions
                        const SizedBox(height: TSizes.spaceBtwSections),

                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ),

                            const SizedBox(width: TSizes.sm),

                            Text.rich(
                                TextSpan(
                              text: '${TTexts.iAgreeTo} ',
                              style: Theme.of(context).textTheme.bodySmall,
                             )
                            ),
                            Text.rich(
                                TextSpan(
                                  text: '${TTexts.privacyPolicy} ',
                                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                                    color: dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark ? TColors.white : TColors.primary,
                                  ),
                                )
                            ),
                            Text.rich(
                                TextSpan(
                                  text: '${TTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                            ),
                            Text.rich(
                                TextSpan(
                                  text: TTexts.termsOfUse,
                                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                                    color: dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark ? TColors.white : TColors.primary,
                                  ),
                                )
                            ),
                          ]
                        ),

                        const SizedBox(height: TSizes.spaceBtwSections),

                        ///Sign Up Button
                        SizedBox( width: double.infinity , child: ElevatedButton(onPressed: () => Get.to( ()=> const VerifyEmailScreen()) , child: const Text(TTexts.createAccount))),

                        const SizedBox(height: TSizes.spaceBtwSections,),

                        ///Divider
                        FormDivider(dark: dark , dividerText: TTexts.orSignInWith.capitalize!),

                        const SizedBox(height: TSizes.spaceBtwSections,),
                        
                        ///Social buttons
                        SocialButtons(dark: dark)
                      ]
                    )
                )

              ]
            )
        ),
      ),
    );
  }
}
