import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendResetPasswordEmail() async{
    try{
      //Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request ...', TImages.docerAnimation );

      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send reset password email
      await AuthenticationRepository.instance.sendResetPasswordEmail(email.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'We have sent you an email to reset your password'
      );

      //Go to reset password screen
      Get.to(()=> ResetPassword(email: email.text.trim(),));

    } catch (e){
       //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show error message
      TLoaders.errorSnackBar(
          title: 'Oh Snap',
          message: e.toString()
      );

    }
  }

  resendResetPasswordEmail(String email) async{
    try{
      //Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request ...', TImages.docerAnimation );

      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send reset password email
      await AuthenticationRepository.instance.sendResetPasswordEmail(email);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'We have sent you an email to reset your password'
      );


    } catch (e){
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show error message
      TLoaders.errorSnackBar(
          title: 'Oh Snap',
          message: e.toString()
      );

    }
  }
}