import 'package:flutter/material.dart';
const bottomContainerHeight = 80.0;
const rcColor =  Color(0xff1d1e33);
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
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
            children: const [
              Expanded(
                child: ReusableCard(
                  colour: rcColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: rcColor,
                ),
              ),
            ],
          )),
          const Expanded(
            child: ReusableCard(colour: rcColor),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    colour: rcColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: rcColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffeb1555),
            margin:const  EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );

  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.colour}) : super(key: key);

  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: rcColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
