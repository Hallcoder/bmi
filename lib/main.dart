import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //you can use ThemeData.dark() and customize some small different part you want using copyWith()
        textTheme: const TextTheme(
          bodyText2:TextStyle(
            color: Colors.white,
          ),
          ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color(0xff0a0e21), secondary: Colors.purple),
      ),
      home: InputPage(),
    );
  }
}
