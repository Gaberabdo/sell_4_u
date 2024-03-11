

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';





import 'login_states.dart';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
 emit(ChangeVisiabilty());
  }
  /// sign in google

  Future<UserCredential> signInWithGoogle() async {
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
      emit(SuccessLoginState());

      print(user!.uid);


      return userCredential;
    } catch (e) {
      emit(ErrorLoginState());
      throw Exception('Failed to sign in with Google: $e');

    }
    //BweGq33jBaXrC0YhaHoClVu1b8x2
  }
///sign in facebook
  Future<void> signInWithFacebook() async {
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
        emit(SuccessLoginState());




      } else {
        emit(ErrorLoginState());
        print("Facebook login failed. Status: ${result.status}");

      }
    } catch (e) {
      emit(ErrorLoginState());
      print("Error during Facebook authentication: $e");

    }
  }
}
