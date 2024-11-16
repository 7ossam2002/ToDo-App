import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/colors_manager.dart';


typedef Validator=String? Function(String?);
class CustomTextFormField extends StatelessWidget {

   CustomTextFormField({super.key,required this.hintText,required this.validator,required this.controller,this.isSecure=false});
  Validator? validator;
  String hintText;
  bool isSecure;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: isSecure,
      validator: validator,
      controller: controller,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: ColorsManager.blueColor,fontSize: 16,fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorsManager.whiteColor,width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorsManager.whiteColor,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorsManager.whiteColor,width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red,width: 2),
        ),
      ),
    );
  }
}
