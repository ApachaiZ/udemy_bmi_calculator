import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/widgets/gender_card.dart';
import 'package:udemy_bmi_calculator/widgets/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color tileColor = Color(0xFF1D1E33);
const Color bottomButtonColor = Color(0xFFEB1555);
const Color activeCardColor = Colors.white;
const Color inactiveCardColor = Colors.blueGrey;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void switchGenderCard(bool gender) {
    setState(() {
      if (gender) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    color: tileColor,
                    cardChild: TextButton(
                      onPressed: () => switchGenderCard(true),
                      child: GenderCard(
                        color: maleCardColor,
                        gender: "MALE",
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: tileColor,
                    cardChild: TextButton(
                      onPressed: () => switchGenderCard(false),
                      child: GenderCard(
                        color: femaleCardColor,
                        gender: "FEMALE",
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: tileColor, borderRadius: BorderRadius.circular(10.0)),
              child: const Text(""),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: const ReusableCard(color: tileColor)),
                ),
                const Expanded(
                  child: ReusableCard(color: tileColor),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: bottomButtonColor,
            ),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
            child: const Center(
              child: Text(
                "Calculer",
                style: TextStyle(color: Colors.white, fontSize: 22.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
