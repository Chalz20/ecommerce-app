import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar(
      {
        super.key,
        this.title,
        this.showBackArrow = false,
        this.leadingIcon,
        this.actions,
        this.leadingOnPress
      }
      );

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow ? IconButton(onPressed: Get.back, icon: Icon(Iconsax.arrow_left, color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black, ))
                    : leadingIcon != null ? IconButton(onPressed: leadingOnPress, icon: Icon(leadingIcon , color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,)) : null,

          title: title,
          actions: actions,

        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
  
}