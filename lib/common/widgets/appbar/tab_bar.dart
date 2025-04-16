import 'package:flutter/material.dart';
import 'package:t_store/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      child:  TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          labelColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          tabs : tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
