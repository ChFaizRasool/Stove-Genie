import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/screen/bottombar_screen.dart';
import 'package:stove_genie/pages/forget_password/presentation/screen/forget_screen.dart';
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
        CustomTextField(
          text: 'Enter Email',
          controller: _email,
        ),
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
          controller: _password,
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
          onTap: () async {
            _auth.signIn(_email.text, _password.text, context);
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

final _email = TextEditingController();
final _password = TextEditingController();
final _auth = Di().sl<AuthCubit>();
