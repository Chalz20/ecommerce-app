import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Image
              Image(
                image:  AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.6 ,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ///Button
              SizedBox( width: double.infinity , child: ElevatedButton(onPressed: onPressed , child: const Text(TTexts.tContinue))),

            ],
          ),
        )
      ),

    );
  }
}
