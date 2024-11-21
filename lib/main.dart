import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(MedicalApp());
}

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
