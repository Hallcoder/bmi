import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
const BottomButton({
Key? key, required this.onTap, required this.buttonTitle,
}) : super(key: key);

final void Function() onTap;
final String buttonTitle;
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: const Color(0xffeb1555),
      margin: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: kBottomContainerHeight,
      child:  Center(child: Text(buttonTitle, style: kLargeButtonStyle)),
    ),
  );
}
}