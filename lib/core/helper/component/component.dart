import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sell_4_u/core/constant.dart';

class Buttonhelper extends StatelessWidget {
  Buttonhelper({this.onchange, this.title});

  String? title;
  VoidCallback? onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(60)),
      child: MaterialButton(
          onPressed: onchange,
          child: Center(
            child: Text(title!,
                style: GoogleFonts.eduNswActFoundation(
                    fontWeight: FontWeight.bold, fontSize: 20)),
          )),
    );
  }
}

void navigatorTo(context, Widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false);
}

dynamic uId = '';

class TextFormWidget extends StatefulWidget {
  TextFormWidget({
    super.key,
    required this.emailController,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
    required this.obscureText,
    required this.icon,
    this.suffixIcon,
    this.enabled,
  });

  final TextEditingController emailController;
  final Widget prefixIcon;
  final String hintText;
  final String validator;
  bool obscureText;
  bool? enabled = true;
  bool icon;
  Widget? suffixIcon;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: Colors.blue,
        enabled: widget.enabled,
        controller: widget.emailController,
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.obscureText,
        onFieldSubmitted: (value) {
          FocusScope.of(context).nextFocus();
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return widget.validator;
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            hintStyle: FontStyleThame.textStyle(
                fontSize: 14, fontWeight: FontWeight.w400),
            suffixIcon: widget.icon
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: widget.obscureText
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off_outlined),
                  )
                : null,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none),
      ),
    );
  }
}
