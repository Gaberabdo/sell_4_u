
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sell_4_u/Features/Auth-feature/presentation/pages/register/cubit/register_states.dart';

import '../../../../manger/model/user_model.dart';



class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);



  UserModel ?userModel;

  Future<void> signInWithFacebook({required String phoneNumber}) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;
        final AuthCredential credential =
        FacebookAuthProvider.credential(accessToken!.token);

        final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;
        print("Firebase User ID: ${user?.uid}");
        print("Firebase User Display Name: ${user?.displayName}");
        print("Firebase User Email: ${user?.email}");
        print("Firebase User Photo URL: ${user?.photoURL}");

        /// Create user document in Firestore
        await createUserInFirestore(user,phoneNumber: phoneNumber);
        emit(SuccessRegisterState());

      } else {
        print("Facebook login failed. Status: ${result.status}");
        emit(ErrorRegisterState());
      }
    } catch (e) {
      print("Error during Facebook authentication: $e");
      emit(ErrorRegisterState());
    }
  }

  Future<void> createUserInFirestore(User? user,{required String phoneNumber}) async {
    try {
      if (user != null) {

        final CollectionReference users =
        FirebaseFirestore.instance.collection('users');


        await users.doc(user.uid).set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
          'phone':phoneNumber

        });

        print('User ${user.uid} added to Firestore');
        emit(SuccessCreateUserState(user.uid));

      } else {
        emit(ErrorCreateUserState());
        print('User is null, unable to create document in Firestore');

      }
    } catch (e) {
      emit(ErrorCreateUserState());
      print('Error creating user document: $e');
    }
  }
///sign up with Google

  Future<UserCredential> signInWithGoogle({required String phoneNumber}) async {
    try {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw Exception('Google sign-in failed');
      }


      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);


      final User? user = userCredential.user;


      await storeUserDataInFirestore(user,phoneNumber: phoneNumber);
      emit(SuccessRegisterState());

      return userCredential;
    } catch (e) {
      emit(ErrorRegisterState());
      throw Exception('Failed to sign in with Google: $e');

    }
  }

  Future<void> storeUserDataInFirestore(User? user,{required String phoneNumber}) async {
    try {
      if (user == null) {
        throw Exception('User is null');
      }


      final CollectionReference users = FirebaseFirestore.instance.collection('users');


      await users.doc(user.uid).set({
        'uid': user.uid,
        'displayName': user.displayName,
        'email': user.email,
      'phone':phoneNumber,
      });

      print('User ${user.uid} added to Firestore');
    } catch (e) {
      print('Error storing user data in Firestore: $e');
      throw Exception('Failed to store user data in Firestore');
    }
  }
  ///sign up using phone
Future<void>PhoneVerify({required String phoneNumber,required String otp})async{
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber:phoneNumber ,
    verificationCompleted: (PhoneAuthCredential credential) async{
      await FirebaseAuth.instance.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    },
    codeSent: (String verificationId, int? resendToken) async{
      String smsCode = otp;


      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);


      await FirebaseAuth.instance.signInWithCredential(credential).then((value){

        emit(SuccessVerisyState());
      });

    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
  Future<void> PhoneVerifyFirst({required String phoneNumber}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          emit(SuccessVerisyState());
        },
        verificationFailed: (FirebaseAuthException e) {
          String errorMessage = 'Phone verification failed';
          if (e.code == 'invalid-phone-number') {
            errorMessage = 'The provided phone number is not valid.';
          }
          emit(ErrorVerifyState(errorMessage: errorMessage));
        },
        codeSent: (String verificationId, int? resendToken) async {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('Phone verification error: $e');
      emit(ErrorVerifyState(errorMessage: 'Phone verification error'));
    }
  }


  Future<void> storeUserDataInFirestorephone(String name, String email, String phoneNumber) async {
    try {

      final CollectionReference users = FirebaseFirestore.instance.collection('users');


      await users.doc(FirebaseAuth.instance.currentUser!.uid!).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'uid': FirebaseAuth.instance.currentUser!.uid!,

      });
      emit(SuccessRegisterState());

      print('User data stored in Firestore');
    } catch (e) {
      emit(ErrorRegisterState());
      print('Error storing user data in Firestore: $e');
    }
  }




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}


