import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udemy_bmi_calculator/widgets/input_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.calculateBMI,
  }) : super(key: key);

  final Function calculateBMI;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        Alert(
          style: const AlertStyle(
            backgroundColor: Color(0xFF1D1E33),
            titleStyle: TextStyle(color: Colors.white),
            descStyle: TextStyle(color: Colors.white),
          ),
          buttons: [
            DialogButton(
              color: Colors.blueAccent,
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          context: context,
          title: (double.parse(calculateBMI()) <= 25) ? ("Vous avez une corpulence normale") : ("Vous êtes en surpoids"),
          desc: "Votre IMC est de ${calculateBMI()}",
        ).show();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: bottomButtonColor,
        ),
        width: double.infinity,
        height: 80.0,
        child: const Center(
          child: Text(
            "Calculer",
            style: TextStyle(color: Colors.white, fontSize: 22.5),
          ),
        ),
      ),
    );
  }
}
