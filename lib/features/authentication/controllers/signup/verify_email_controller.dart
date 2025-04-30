import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  //Send email whenever the verify screen appears & set timer for autodirecting
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoDirect();
    super.onInit();

  }

  //Send Email Verification Link
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your email to verify your account'
      );
    }
    catch(e){
      TLoaders.errorSnackBar(
          title: 'Oh Snap',
          message: e.toString()
      );
    }
  }

  //Timer to autodirect on email verification
  setTimerForAutoDirect() async{
    Timer.periodic(const Duration(seconds: 1), (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified ?? false){
          timer.cancel();
          Get.off(
                  () => SuccessScreen(
                      image: TImages.staticSuccessIllustration,
                      title: TTexts.yourAccountCreatedTitle,
                      subtitle: TTexts.yourAccountCreatedSubTitle,
                      onPressed: () => AuthenticationRepository.instance.screenRedirect(),
                  )
          );
        }
    }
    );
  }

  //Manually check for email verification
  checkEmailVerification() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
              () => SuccessScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          )
      );
    }
  }


}