import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/screen/bottombar_screen.dart';
import 'package:stove_genie/pages/forget_password/presentation/screen/forget_screen.dart';
import 'package:stove_genie/pages/sign_up/presentation/widget/check_row.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class SignInField extends StatelessWidget {
  const SignInField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          height: 15,
        ),
        //  forget password
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ForgetScreen()));
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.buttonColor),
          ),
        ),
        SizedBox(
          height: 40,
        ),

        CustomButton(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeBottomBar()),
              (route) => false,
            );
          },
          text: 'Sign In',
          svgPicture: AppImages.forwodicon,
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
