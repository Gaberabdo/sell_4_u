import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_4_u/Features/Auth-feature/presentation/pages/register/cubit/register_states.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/feeds_screen.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/helper/component/component.dart';
import '../../../../../generated/l10n.dart';
import 'cubit/register_cubit.dart';



class OtpScreen extends StatefulWidget {
  OtpScreen({required this.phoneNumber, required this.email, required this.name});

  String phoneNumber;
  String name;
  String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  String? verificationId;

  void phoneVerify() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: e.message ?? 'Verification failed',
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void sendOtp() async {
    try {
      String smsCode = pinController.text;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
      RegisterCubit.get(context).storeUserDataInFirestorephone(widget.name, widget.email, widget.phoneNumber);
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.toString(),
        ),
      );
    }
  }

  void resendOtp() async {
    phoneVerify();
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: 'OTP resent successfully',
      ),
    );
  }

  @override
  void initState() {
    phoneVerify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SuccessRegisterState) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: 'Verification success',
              ),
            );
            navigatorTo(context, HomeFeeds());
          }
          if (state is ErrorRegisterState) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: 'Enter correct OTP',
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).verfyEmail,
                style: GoogleFonts.tajawal(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      length: 6,
                      controller: pinController,
                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      separatorBuilder: (index) => SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.blue),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      errorPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.redAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          resendOtp();
                        },
                        child: Text(
                          S.of(context).resendOtp,
                          style: GoogleFonts.tajawal(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 45,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        String otp = pinController.text;
                        print('Entered OTP: $otp');
                        sendOtp();
                      },
                      child: Text(
                        S.of(context).verfyEmail,
                        style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

