import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Widget? xicon;
  final Function()? onTap;
  final bool isreadonly;
  final bool isPass;

  final TextEditingController? controller;
  final TextInputType? keyboardtype;

  const CustomTextField({
    super.key,
    required this.text,
    this.icon,
    this.xicon,
    this.isPass = false,
    this.onTap,
    this.isreadonly = false,
    this.controller,
    this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      style: GoogleFonts.inter(),
      onTap: onTap,
      keyboardType: keyboardtype,
      readOnly: isreadonly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          // borderSide: BorderSide(
          //   color: AppColors.fieldBoderColors,
          //   width: 1.0,
          // ),
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.buttonColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        fillColor: AppColors.fieldColor,
        hintText: text,
        hintStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.hinttextColor),
        // prefixIcon:  Padding(
        //   padding: const EdgeInsets.only(top: 12.0, bottom: 12),
        //   child: icon,
        // ),
        suffixIcon: xicon,
      ),
    );
  }
}
