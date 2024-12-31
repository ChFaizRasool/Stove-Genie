import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});
  @override
  Widget build(BuildContext context) {
    int intialIndex = 0;
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: 3,
        // padding: EdgeInsets.only(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: intialIndex == 0 ? 30 : 15),
            child: Stack(children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 160,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.containeColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Classic Greek Salad",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.resipetextColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                'Time',
                                style: GoogleFonts.poppins(
                                    color: AppColors.cheifColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
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
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                '15 Mins',
                                style: GoogleFonts.poppins(
                                    color: AppColors.resipetextColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.saveselected),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 160,
                left: 40,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('assets/images/menu.png')),
                ),
              ),
              Positioned(
                top: 30,
                left: 105,
                child: Container(
                  width: 40,
                  height: 23,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.rateContainerColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/rate_star.svg'),
                        ],
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.5',
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
