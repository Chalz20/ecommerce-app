import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  //Save user data from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
     try{
       if(userCredentials != null){
         // Convert name to First and last name
         final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
         final userName = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

         // Map to user model
         final user = UserModel(
             id: userCredentials.user!.uid,
             firstName: nameParts[0],
             lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
             username: userName,
             email: userCredentials.user!.email ?? '',
             phoneNumber: userCredentials.user!.phoneNumber ?? '',
             profilePicture: userCredentials.user!.photoURL ?? '',
         );
         
         // Save user data in the Firestore Database
         await UserRepository.instance.saveUserData(user);

       }

     } catch (e){
       TLoaders.errorSnackBar(
           title: 'Data not saved',
           message:  'Something went wrong while saving your information. Please try again.'
       );
     }
  }
}