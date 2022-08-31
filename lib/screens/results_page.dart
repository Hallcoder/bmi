import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmiResult, required this.resultText, required this.interpretation}) : super(key: key);
 final String bmiResult;
 final String resultText;
 final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('BMI Calculator')
      ),
      body:Column(
        children: [
        const  Text('Your Result',style: kNumberStyle),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kActiveColor,
              ),
              margin:const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(resultText.toUpperCase(),style: kresultsText),
                  Text(bmiResult,style: kresultNumber),
                  Text(interpretation,textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')
        ],
      )
    );
  }
}
