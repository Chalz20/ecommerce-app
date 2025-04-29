import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs; //Hides the password
  final privacyPolicyChecked = true.obs; //Checks the privacy policy
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

 ///SignUp
  void signUp() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are creating your account', TImages.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      //Form Validation
      if(!signupFormKey.currentState!.validate()) return;

      //Privacy Policy check
      if(!privacyPolicyChecked.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy policy',
            message: 'Please read and accept the privacy policy to continue with the registration process'
        );
        return;
      }

      //Register User in the Firebase Authentication & Save user data in the Firestore Database
      final userCredentials = await AuthenticationRepository.instance.registerWithEmailAndPassword( email.text.trim() , password.text.trim() );

      //Save user data in the Firestore Database


      //Show success message

      //Navigate to the Verify Email Screen

    } catch(e) {
      //Show error message
      TLoaders.errorSnackBar(
          title: "Oh Snap" ,
          message: e.toString()
      );

    } finally {
      //Stop Loading
       TFullScreenLoader.stopLoading();
    }

  }
}