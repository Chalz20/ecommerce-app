
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //Variables
  final  pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  //Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Update current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      //Set the first time to false
      final storage = GetStorage();
      storage.write('isFirstTime', false);

      //Navigate to the login screen
      Get.offAll(const LoginScreen());
    }else {
    int page = ++currentPageIndex.value;
    pageController.jumpToPage(page);
    }
  }

  //Update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
