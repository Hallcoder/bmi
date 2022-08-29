import 'package:flutter/material.dart';

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

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: const Center(
        child: Text('Body Text'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
