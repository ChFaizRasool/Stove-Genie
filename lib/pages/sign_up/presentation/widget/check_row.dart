import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stove_genie/pages/sign_up/presentation/provider/check_box_provider.dart';

import 'package:stove_genie/utils/colors.dart';

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<CheckBoxProvider>(
          builder: (context, checkBoxProvider, _) {
            return Checkbox(
              checkColor: AppColors.whiteColor,
              activeColor: AppColors.textColor,
              side: BorderSide(color: AppColors.textColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: checkBoxProvider.isChecked,
              onChanged: (value) {
                checkBoxProvider.toggleCheck(value!);
              },
            );
          },
        ),
        Text(
          'Accept terms & Condition',
          style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor),
        )
      ],
    );
  }
}
