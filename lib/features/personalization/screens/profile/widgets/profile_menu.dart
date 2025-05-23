import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
    this.icon = Iconsax.arrow_right_34,
  });

  final String title,value;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded( flex: 3 , child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, ),),
            Expanded( flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,),),
            Expanded(child: Icon(icon, size: 18,))
          ],
        ),
      ),
    );
  }
}