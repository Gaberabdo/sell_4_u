import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../../core/helper/component/component.dart';



import '../register/register_screen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            // navigatorTo(context, HomePage());

          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('Sign In',
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
                  key: formKey,
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                          keyboardAppearance: Brightness.dark,
                          decoration: InputDecoration(

                            labelText: 'Email',
                            labelStyle: GoogleFonts.eduNswActFoundation(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
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
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    "Forgot password?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    )
                                )
                              ],
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
                                  color: Colors.green.shade700,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: MaterialButton(
                                
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {

                                
                                    }
                                    if(state is SuccessLoginState){
                                      print('donnnnnnnnnnnnne');
                                    }
                                  },
                                  child: Text(
                                    'Sign In',
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
                                      return RegisterScreen();
                                    }));
                                  },
                                  child: Text(
                                      "Sign up ",
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
