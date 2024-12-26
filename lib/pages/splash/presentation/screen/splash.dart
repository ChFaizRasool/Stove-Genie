import 'package:flutter/material.dart';
import 'package:stove_genie/pages/on_boarding/presentation/screen/get_cooking.dart';
import 'package:stove_genie/utils/helper.dart';
import 'dart:async';

import 'package:stove_genie/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetCooking()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          AppImages.logoImage,
          width: getWidth(context) * 0.5,
          height: getHeight(context) * 0.25,
        ),
      ),
    );
  }
}
