import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/helper.dart';

Widget profileRow(context) {
  return SizedBox(
    width: getWidth(context) * 0.85,
    child: Row(
      children: [
        Container(
          width: 99,
          height: 99,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'))),
        ),
        SizedBox(
          width: 25,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Recipe',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xffa9a9a9)),
                ),
                Text('3',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff121212))),
              ],
            ),
            Column(
              children: [
                Text('Followers',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xffa9a9a9))),
                Text('145',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff121212))),
              ],
            ),
            Column(
              children: [
                Text('Following',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xffa9a9a9))),
                Text('1000',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff121212))),
              ],
            ),
          ],
        ))
      ],
    ),
  );
}
