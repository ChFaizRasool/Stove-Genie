import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/firebase_options.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:stove_genie/pages/home/presentation/provider/category_provider.dart';
import 'package:stove_genie/pages/sign_up/presentation/provider/check_box_provider.dart';
import 'package:stove_genie/pages/splash/presentation/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Di().init();
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
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
