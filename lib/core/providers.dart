import 'package:flutter/material.dart'; // ✅ needed for Widget
import 'package:provider/provider.dart';
import 'package:stove_genie/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:stove_genie/pages/home/presentation/provider/category_provider.dart';
import 'package:stove_genie/pages/sign_up/presentation/provider/check_box_provider.dart';

MultiProvider initProviders({required Widget child}) {
  return MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
      // ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      // ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ],
    child: child,
  );
}
