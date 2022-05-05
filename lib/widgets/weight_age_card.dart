import 'package:flutter/material.dart';
import 'package:udemy_bmi_calculator/constants.dart';

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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all((Colors.white10)),
                shape: MaterialStateProperty.all(
                  const CircleBorder(
                    side: BorderSide(color: Colors.black26),
                  ),
                ),
              ),
              onPressed: () => widget.updateCard(
                type: widget.type,
                operation: false,
              ),
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all((Colors.white10)),
                shape: MaterialStateProperty.all(
                  const CircleBorder(
                    side: BorderSide(color: Colors.black26),
                  ),
                ),
              ),
              onPressed: () => widget.updateCard(
                type: widget.type,
                operation: true,
              ),
              child: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
