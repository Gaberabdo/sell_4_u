import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_4_u/Features/Auth-feature/presentation/pages/register/register_screen.dart';

class PhoneScreen extends StatelessWidget {
   PhoneScreen({super.key});
  var phoneController = TextEditingController();
   var globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: globalFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: Colors.black,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                obscureText: false,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'please enter your phone ';
                  }
                  return null;
                },
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  labelText: 'phone',
                  labelStyle: GoogleFonts.eduNswActFoundation(
                      fontSize: 20, color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.phone,
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
                height: 50,
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: MaterialButton(

                  onPressed: () {
                    if (globalFormKey.currentState!.validate()) {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  RegisterScreen(phoneNumber: phoneController.text,);
                     }));
                    }
                  },

                  child: Text(
                    'Complete Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
