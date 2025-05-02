import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController{

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ;
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ;
    super.onInit();
  }

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  ///Login with email and password
  void emailAndPasswordSignIn() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are logging you in', TImages.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Store email and password in local storage if remember me is checked
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Register User in the Firebase Authentication & Save user data in the Firestore Database
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword( email.text.trim() , password.text.trim() );

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e) {
      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show error message
      TLoaders.errorSnackBar(
          title: "Oh Snap",
          message: e.toString()
      );
    }
  }

  ///Sign in with Google
 Future<void> signInWithGoogle() async{
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are logging you in', TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //Save the data
      await userController.saveUserRecord(userCredentials);

      //Stop Loading
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e) {
      //Stop Loading
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
          title: "Oh Snap",
          message: e.toString()
      );
    }
 }


}