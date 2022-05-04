import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/widgets/bottom_button.dart';
import 'package:udemy_bmi_calculator/widgets/gender_card.dart';
import 'package:udemy_bmi_calculator/widgets/reusable_card_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_bmi_calculator/widgets/weight_age_card.dart';

const Color activeTileColor = Color(0xFF1D1E33);
const Color inactiveTileColor = Color(0xFF111328);
const Color bottomButtonColor = Color(0xFFEB1555);
const Color activeCardColor = Colors.white;
const Color inactiveCardColor = Colors.blueGrey;

const Color inactiveCardBackgroundColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Color maleBackgroundCardColor = inactiveTileColor;
  Color femaleBackgroundCardColor = inactiveTileColor;

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  double height = 150;
  int weight = 60;
  int age = 18;
  double bmi = 0.0;

  void switchGenderCard(bool gender) {
    setState(() {
      if (gender) {
        maleCardColor = activeCardColor;
        maleBackgroundCardColor = activeTileColor;
        femaleCardColor = inactiveCardColor;
        femaleBackgroundCardColor = inactiveTileColor;
      } else {
        maleCardColor = inactiveCardColor;
        maleBackgroundCardColor = inactiveTileColor;
        femaleCardColor = activeCardColor;
        femaleBackgroundCardColor = activeTileColor;
      }
    });
  }

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

  String calculateBMI(){
    bmi = weight / (height*height) * 10000;
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
                    color: maleBackgroundCardColor,
                    cardChild: TextButton(
                      onPressed: () => switchGenderCard(true),
                      child: GenderCard(
                        color: maleCardColor,
                        gender: "HOMME",
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                //Choice of gender FEMALE
                Expanded(
                  child: ReusableCardBackground(
                    color: femaleBackgroundCardColor,
                    cardChild: TextButton(
                      onPressed: () => switchGenderCard(false),
                      child: GenderCard(
                        color: femaleCardColor,
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
                  color: activeTileColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "TAILLE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blueGrey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${height.toInt()}",
                          style: const TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
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
                        activeColor: Colors.red,
                        value: height,
                        onChanged: (newHeight) {
                          setState(() => height = newHeight);
                        },
                        min: 050,
                        max: 300,
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
                    color: activeTileColor,
                    cardChild: WeightAgeCard(
                      type: true,
                      updateCard: updateCard,
                      value: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardBackground(
                    color: activeTileColor,
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
          BottomButton(calculateBMI: calculateBMI,),
        ],
      ),
    );
  }
}
