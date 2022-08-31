import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_Card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeColor = Color(0xff1d1e33);
const inactiveColor = Color(0xff111328);
enum Genders{male,female,none}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  late Genders selectedGender = Genders.none;

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
                  onPress: (){
                    setState(() {
                      selectedGender = Genders.male;
                    });
                  },
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars, text: 'MALE'),
                  colour: selectedGender == Genders.male ? activeColor:inactiveColor,
                ),
              ),
               Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Genders.female;
                    });
                  },
                  cardChild:
                     const IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  colour: selectedGender == Genders.female? activeColor:inactiveColor,
                ),
              ),
            ],
          )),
          const Expanded(
            child: ReusableCard(
              colour: activeColor,
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xffeb1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
