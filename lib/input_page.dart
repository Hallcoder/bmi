import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_Card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Genders { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  late Genders selectedGender = Genders.none;
  int height = 180;
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
                  onPress: () {
                    setState(() {
                      selectedGender = Genders.male;
                    });
                  },
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars, text: 'MALE'),
                  colour: selectedGender == Genders.male
                      ? kActiveColor
                      : kInactiveColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Genders.female;
                    });
                  },
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  colour: selectedGender == Genders.female
                      ? kActiveColor
                      : kInactiveColor,
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text('HEIGHT'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumberStyle,
                      ),
                      const Text(
                        'cm',
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    activeColor: const Color(0xffeb1555),
                    inactiveColor: const Color(0xff8d8e98),
                    min:120.0,
                    max:250.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffeb1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
