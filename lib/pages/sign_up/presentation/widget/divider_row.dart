import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/google_container.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            children: [
              Expanded(child: Divider()),
              Text(
                'Or Sign up With',
                style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hinttextColor),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110),
          child: Row(
            children: [
              GoogleContainer(image: AppImages.googleImage),
              SizedBox(width: 20),
              GoogleContainer(image: AppImages.facebookImage),
            ],
          ),
        ),
      ],
    );
  }
}
