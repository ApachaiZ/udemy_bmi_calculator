import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/constants.dart';
import 'package:udemy_bmi_calculator/widgets/bottom_button.dart';
import 'package:udemy_bmi_calculator/widgets/gender_card.dart';
import 'package:udemy_bmi_calculator/widgets/reusable_card_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_bmi_calculator/widgets/weight_age_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  double height = 150;
  int weight = 60;
  int age = 18;
  double bmi = 0.0;

  KGender myGender = KGender.none;

  void updateCard({required bool type, required bool operation}) {
    if (type) {
      operation
          ? (setState(() {
              weight++;
            }))
          : setState(() {
              weight--;
            });
    } else {
      operation
          ? (setState(() {
              age++;
            }))
          : setState(() {
              age--;
            });
    }
  }

  String calculateBMI() {
    bmi = weight / (height * height) * 10000;
    return bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculateur d'IMC"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Part 1 of the Column
          Expanded(
            //Gender choice row
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Choice of gender MALE
                Expanded(
                  child: ReusableCardBackground(
                    color: myGender == KGender.male
                        ? kActiveTileColor
                        : kInactiveTileColor,
                    cardChild: TextButton(
                      onPressed: () => setState(() {
                        myGender = KGender.male;
                      }),
                      child: GenderCard(
                        color: myGender == KGender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        gender: "HOMME",
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                //Choice of gender FEMALE
                Expanded(
                  child: ReusableCardBackground(
                    color: myGender == KGender.female
                        ? kActiveTileColor
                        : kInactiveTileColor,
                    cardChild: TextButton(
                      onPressed: () => setState(() {
                        myGender = KGender.female;
                      }),
                      child: GenderCard(
                        color: myGender == KGender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        gender: "FEMME",
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Part 2 of the Column
          //Height choice slider
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kActiveTileColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "TAILLE",
                      style: kLabelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.toInt()}",
                          style: kValueText,
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Center(
                      child: Slider(
                        activeColor: kBottomButtonColor,
                        inactiveColor: kInactiveTileColor,
                        value: height,
                        onChanged: (newHeight) {
                          setState(() => height = newHeight);
                        },
                        min: 120,
                        max: 240,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Part 3 of the Column
          //Weight and Age Choice
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCardBackground(
                    color: kActiveTileColor,
                    cardChild: WeightAgeCard(
                      type: true,
                      updateCard: updateCard,
                      value: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardBackground(
                    color: kActiveTileColor,
                    cardChild: WeightAgeCard(
                      type: false,
                      updateCard: updateCard,
                      value: age,
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            calculateBMI: calculateBMI,
          ),
        ],
      ),
    );
  }
}
