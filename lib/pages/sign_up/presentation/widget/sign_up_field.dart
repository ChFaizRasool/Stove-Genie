import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/sign_up/presentation/widget/check_row.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Full NAme
        Text(
          'Name',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(text: 'Enter Name'),
        SizedBox(
          height: 11,
        ),

        //  Enter Email
        Text(
          'Email',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(text: 'Enter Email'),
        SizedBox(
          height: 11,
        ),

        //  password
        Text(
          'Password',
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(
          text: 'Enter Passwrod',
          isPass: true,
        ),
        SizedBox(
          height: 11,
        ),
        //  Confirm Password
        Text(
          'Confirm Password',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.h1Color,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(
          text: 'Retype Password',
        ),
        SizedBox(
          height: 38,
        ),
        CheckBoxRow(),
        SizedBox(
          height: 32,
        ),

        CustomButton(
          text: 'Sign Up',
          svgPicture: AppImages.forwodicon,
        ),
      ],
    );
  }
}
