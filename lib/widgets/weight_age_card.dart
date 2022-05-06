import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/constants.dart';
import 'package:udemy_bmi_calculator/widgets/weight_age_custom_button.dart';

class WeightAgeCard extends StatefulWidget {
  const WeightAgeCard({
    Key? key,
    required this.type,
    required this.value,
    required this.updateCard,
  }) : super(key: key);

  final bool type;
  final int value;
  final Function updateCard;

  @override
  WeightAgeCardState createState() => WeightAgeCardState();
}

class WeightAgeCardState extends State<WeightAgeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.type ? " POIDS" : "ÂGE",
          style: kLabelText,
        ),
        Text(
          "${widget.value}",
          style: kValueText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeightAgeCustomButton(
              updateCard: widget.updateCard,
              type: widget.type,
              operation: false,
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10.0,
            ),
            WeightAgeCustomButton(
              updateCard: widget.updateCard,
              type: widget.type,
              operation: true,
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
