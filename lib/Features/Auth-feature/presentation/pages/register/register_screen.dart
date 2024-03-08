import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../core/helper/cache/cache_helper.dart';
import '../../../../../core/helper/component/component.dart';


import '../login/login_screen.dart';

import 'cubit/register_cubit.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var globalFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SuccessCreateUserState) {
            // navigatorTo(
            //   context,
            //   HomePage(),
            // );
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ClipPath(
                              child: Image.asset('assest/images/photo_2024-02-28_16-51-32.jpg',
                                height: 200,),

                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your full name';
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: GoogleFonts.eduNswActFoundation(
                                      fontSize: 20, color: Colors.black),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.black,
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
                              height: 10,
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: GoogleFonts.eduNswActFoundation(
                                      fontSize: 20, color: Colors.black),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
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
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,

                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email password';
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                  labelText: 'password',
                                  labelStyle: GoogleFonts.eduNswActFoundation(
                                      fontSize: 20, color: Colors.black),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(
                                      cubit.suffix,
                                      color: Colors.black,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black,
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
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoadingRegisterState,
                              builder: (context) => Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade700,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: MaterialButton(

                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //   return HomePage();
                                    // }));

                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              fallback: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black54,
                                  ),
                                );
                              },
                            ),

                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Don’t have an account? ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,

                                    )
                                ),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return LoginScreen();
                                    }));
                                  },
                                  child: Text(
                                      "Sign In ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700

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
