import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Color(0xff1d1e33),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Color(0xff1d1e33),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(colour: Color(0xff1d1e33)),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Color(0xff1d1e33),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: Color(0xff1d1e33),
              )),
            ],
          )),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour});

  Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
