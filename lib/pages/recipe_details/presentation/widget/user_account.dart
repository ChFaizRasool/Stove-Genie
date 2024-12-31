import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/helper.dart';

Widget userAccount(context,String imgPath,String name,String loc) {
  return SizedBox(
    width: getWidth(context) * 0.9,
    child: Row(
      children: [
        CircleAvatar(
          child: Image.asset(imgPath),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 15,
                  color: Color(0xffFFA307),
                ),
                Text(loc,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffa9a9a9)))
              ],
            )
          ],
        ),
        Spacer(),
        Container(
          width: 85,
          height: 37,
          decoration: BoxDecoration(
              color: Color(0xffFFA307),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text('Follow',style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,color: Colors.white)),
          ),
        )
      ],
    ),
  );
}
