import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/screen/bottombar_screen.dart';
import 'package:stove_genie/pages/home/presentation/screen/home_screen.dart';
import 'package:stove_genie/pages/sign_up/presentation/provider/check_box_provider.dart';
import 'package:stove_genie/pages/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:stove_genie/pages/splash/presentation/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
