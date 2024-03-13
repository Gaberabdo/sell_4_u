import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_4_u/Features/Auth-feature/presentation/pages/register/phone%20screen.dart';
import 'package:sell_4_u/Features/Home-feature/view/screens/home/feeds_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';





import '../../../../../core/helper/component/component.dart';
import '../../../../../generated/l10n.dart';
import '../register/register_screen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


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
        print("Firebase User Email: ${user?.email}");
        print("Firebase User Photo URL: ${user?.photoURL}");


      } else {
        print("Facebook login failed. Status: ${result.status}");
      }
    } catch (e) {
      print("Error during Facebook authentication: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is SuccessLoginState){
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:'Login success',
              ),
            );
            navigatorTo(context, HomeFeeds());

          }
          if(state is ErrorLoginState){
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message:'Login Error',
              ),
            );


          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text( S.of(context).signIn,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              ) ,
              centerTitle: true,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [


                          TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return S.of(context).pleasePhone;
                            }
                            return null;
                          },
                          keyboardAppearance: Brightness.dark,
                          decoration: InputDecoration(

                            labelText: S.of(context).Phone,
                            labelStyle: GoogleFonts.eduNswActFoundation(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12), // Set the border radius
                              borderSide: BorderSide.none, // Remove the border
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,

                          )
                        ),



                        const SizedBox(
                              height: 15,
                            ),
                            TextFormField(

                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: cubit.isPassword,

                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleasePassword;
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(

                                  labelText: S.of(context).Password,
                                  labelStyle: GoogleFonts.eduNswActFoundation(
                                      fontSize: 20, color: Colors.grey),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(
                                      cubit.suffix,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12), // Set the border radius
                                  borderSide: BorderSide.none, // Remove the border
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                            ),

                            const SizedBox(
                              height: 40,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoadingLoginState,
                              builder: (context) => Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade200,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: MaterialButton(
                                
                                  onPressed: () async{

                                    if (formKey.currentState!.validate()) {


                                    }

                                    if(state is SuccessLoginState){
                                      print('donnnnnnnnnnnnne');
                                    }
                                  },
                                  child: Text(
                                    S.of(context).signIn,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              fallback: (context) {
                                return  Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green.shade700,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    height: 1,

                                    color: Colors.grey,
                                  ),
                                ),
                                Text(S.of(context).Or,
                                  style: TextStyle(
                                      fontSize: 16

                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 1,

                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                InkWell(
                                  onTap: (){
                                    cubit.signInWithFacebook();
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade300
                                    ),
                                    child: Center(child: FaIcon(FontAwesomeIcons.facebook,size: 35,)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.signInWithGoogle();
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade300
                                    ),
                                    child: Center(child: FaIcon(FontAwesomeIcons.google,size: 30,)),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    S.of(context).donthave,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,

                                    )
                                ),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return PhoneScreen();
                                    }));
                                  },
                                  child: Text(
                                      S.of(context).CreateAccount,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold

                                      )
                                  ),
                                )
                              ],
                            ),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
