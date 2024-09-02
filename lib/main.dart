import 'package:electis_shopping_app/screens/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'styles/app_colors.dart';

void main() {
  runApp(ElectisShoppingApp());
}

class ElectisShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electis Shopping App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkColor,
        primaryColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Inter',
          bodyColor: AppColors.darkColor,
          displayColor: AppColors.darkColor,
        ),
      ),
      home: HomeScreen(),
    );
  }
}


