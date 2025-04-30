import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../navigation_menu.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from main.dart on app startup
  @override
  void onReady(){
    FlutterNativeSplash.remove();// Remove splash screen
    screenRedirect();
  }

  screenRedirect() async{
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        //If email is verified go to navigation menu
        Get.offAll(() => const NavigationMenu());
      }else{
        //If email is not verified go to verify email screen
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    }else{
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ?
      Get.offAll(() => const LoginScreen()) :
      Get.offAll(()=> const OnboardingScreen());

    }

  }

  ///Registration with email & password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
      try{
       return await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
      on FirebaseAuthException catch(e){
        throw TFirebaseAuthException(e.code).message;
      }
      on FirebaseException catch(e){
        throw TFirebaseException(e.code).message;
      }
      on FormatException catch(e) {
        throw const TFormatException();
      }
      on PlatformException catch(e) {
        throw TPlatformException(e.code).message;
      }
      catch (e) {
        throw 'Something went wrong, Please try again';
      }
  }

  ///Email Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }
    on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch(e) {
      throw const TFormatException();
    }
    on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///Logout
 Future<void> logout() async {
   try {
     await FirebaseAuth.instance.signOut();
   }
   on FirebaseAuthException catch (e) {
     throw TFirebaseAuthException(e.code).message;
   }
   on FirebaseException catch (e) {
     throw TFirebaseException(e.code).message;
   }
   on FormatException catch (e) {
     throw const TFormatException();
   }
   on PlatformException catch (e) {
     throw TPlatformException(e.code).message;
   }
   catch (e) {
     throw 'Something went wrong, Please try again';
   }
 }

}