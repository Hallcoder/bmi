import 'package:bmi/calculator_brain.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_Card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
enum Genders { male, female, none }
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  late Genders selectedGender = Genders.none;
  int height = 180;
  int weight = 60;
  int age = 16;
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
                    //use sliderTheme as a parent to customize the slider's look
                    value: height.toDouble(),
                    activeColor: const Color(0xffeb1555),
                    inactiveColor: const Color(0xff8d8e98),
                    min: 120.0,
                    max: 250.0,
                    onChanged: (double newValue) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: buildColumn('WEIGHT',weight),
                  ),
                ),
                 Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: buildColumn('AGE',age),
                  ),
                ),
              ],
            ),
          ),
           BottomButton(buttonTitle: 'CALCULATE',onTap: (){
             CalculatorBrain calc = CalculatorBrain(weight, height);
             String bmiRes = calc.calculateBMI();
             String res = calc.getResult();
             String interpretation = calc.getInterpretation();
             Navigator.push(context,MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: bmiRes,resultText: res,interpretation: interpretation,)));
           }),
        ],
      ),
    );
  }
  Column buildColumn(String label,int value) {
    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(label),
                      Text(
                        '$value',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          RoundIconButton(
                            child: const Icon(FontAwesomeIcons.minus),
                            onPress:(){
                              setState(() {
                                value == weight ? weight--:age--;
                              });
                            }
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            child: const Icon(FontAwesomeIcons.plus),
                              onPress:(){
                                setState(() {
                                  value == weight ? weight++:age++;
                                });
                              }
                          )
                        ],
                      )
                    ],
                  );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.child, required this.onPress}) : super(key: key);
  final Widget child;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed:onPress,
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      child: child,
    );
  }
}
