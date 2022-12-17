import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greengrocer/src/services/utils.service.dart';

class GreenGrocerLogo extends StatelessWidget {
  GreenGrocerLogo(
      {Key? key,
      required this.fontSize,
      required this.greenColor,
      required this.grocerColor})
      : super(key: key);

  final double fontSize;
  final Color greenColor;
  final Color grocerColor;

  final utilService = UtilService();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: grocerColor,
            ),
          ),
        ],
      ),
    );
  }
}
