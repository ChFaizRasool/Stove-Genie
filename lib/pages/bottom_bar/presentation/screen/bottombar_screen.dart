import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:stove_genie/pages/home/presentation/screen/home_screen.dart';
import 'package:stove_genie/pages/notification_screen/presentation/screen/notification_screen.dart';
import 'package:stove_genie/pages/profile_screen/presentation/screen/profile_screen.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/screen/saved_recipes_screen.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class HomeBottomBar extends StatelessWidget {
  final List<Widget> screens = const [
    HomeScreen(),
    SavedRecipesScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: screens[bottomNavProvider.currentIndex],
      backgroundColor: Colors.white, // White background color
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Notch shape
        notchMargin: 10,
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 40,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    context,
                    index: 0,
                    icon: AppImages.homeunSelected,
                    selectedIcon: AppImages.homeSelected,
                  ),
                  _buildNavItem(
                    context,
                    index: 1,
                    icon: AppImages.saveUnSelected,
                    selectedIcon: AppImages.saveselected,
                  ),
                ],
              ),
              // Space for the Floating Action Button
              Row(
                spacing: 40,
                children: [
                  _buildNavItem(
                    context,
                    index: 2,
                    icon: AppImages.notificatonUnselected,
                    selectedIcon: AppImages.notificatonselected,
                  ),
                  _buildNavItem(
                    context,
                    index: 3,
                    icon: AppImages.profileunseleted,
                    selectedIcon: AppImages.profileSeleted,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(

      //   backgroundColor: AppColors.buttonColor,
      //   onPressed: () {},
      //   child: SvgPicture.asset(
      //     AppImages.plusIcon,
      //   ),
      // ),
      floatingActionButton: Container(
        height: 55,
        width: 55,
        decoration:
            BoxDecoration(color: AppColors.buttonColor, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.plusIcon),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required int index,
      required String icon,
      required String selectedIcon}) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return GestureDetector(
      onTap: () => bottomNavProvider.setIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            bottomNavProvider.currentIndex == index ? selectedIcon : icon,
          ),
          // const SizedBox(height: 5),
          // if (bottomNavProvider.currentIndex == index)
          //   // Container(
          //   //   height: 4,
          //   //   width: 4,
          //   //   decoration: const BoxDecoration(
          //   //       borderRadius: BorderRadius.all(Radius.circular(2)),
          //   //       color: AppColors.buttonColor),
          //   // ),
        ],
      ),
    );
  }
}
