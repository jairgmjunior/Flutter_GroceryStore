import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/components/greengrocer_logo.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SigninSupScreen extends StatelessWidget {
  const SigninSupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //nome do app
        GreenGrocerLogo(
          fontSize: 40,
          greenColor: Colors.white,
          grocerColor: CustomColors.customContrastColor,
        ),
        //categorias
        SizedBox(
          height: 30,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 25,
            ),
            child: AnimatedTextKit(
              pause: Duration.zero,
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText('Frutas'),
                FadeAnimatedText('Verduras'),
                FadeAnimatedText('Carnes'),
                FadeAnimatedText('Cereais'),
                FadeAnimatedText('Laticínios'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
