import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/widgets/input_page.dart';

main() => runApp(const BMICalculator());

const Color themeColor = Color(0xFF0A0E21);

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: themeColor,
        scaffoldBackgroundColor: themeColor,
        appBarTheme: const AppBarTheme(
          color: themeColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.blueGrey),
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      title: "BMI Calculator",
      home: const InputPage(),
    );
  }
}
