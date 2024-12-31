import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class NewRecipes extends StatelessWidget {
  const NewRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    int intialIndex = 0;
    return ListView.builder(
      padding: EdgeInsets.only(left: intialIndex == 0 ? 30 : 15),
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Card(
                child: Container(
                  height: 95,
                  width: 251,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.whiteColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 90),
                        child: Text(
                          'Steak with tomato sauce and bulgur rice.',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.resipetextColor),
                          maxLines: 1, // Ensures the text is limited to 1 line
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 40),
                        child: Row(
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: Color(0xffffad30),
                                );
                              }),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.flameIcon),
                              ],
                            ),
                            Text(
                              '1081 KCal',
                              style: GoogleFonts.poppins(
                                  color: AppColors.falmetextColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                  'assets/images/cheif_profile.png'),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'By James Milner',
                              style: GoogleFonts.poppins(
                                  color: AppColors.cheifColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.timerIcon),
                              ],
                            ),
                            // SizedBox(
                            //   width: 8,
                            // ),
                            Text(
                              '20 mins',
                              style: GoogleFonts.poppins(
                                  color: AppColors.cheifColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 95,
            left: 170,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/images/tomato_steak.png'),
            ),
          ),
        ]);
      },
    );
  }
}
