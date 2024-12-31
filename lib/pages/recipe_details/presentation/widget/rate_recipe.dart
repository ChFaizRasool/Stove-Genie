import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showRateRecipeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Rate Recipe',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star_outline,
                        color: Color(0xffffad30),
                      ),
                      onPressed: () {
                        
                      },
                    );
                  }),
                ),
                SizedBox(height: 5),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffFFA307),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text('Send',style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),),
                  )
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}