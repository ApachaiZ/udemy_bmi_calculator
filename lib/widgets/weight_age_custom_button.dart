import 'package:flutter/material.dart';

class WeightAgeCustomButton extends StatelessWidget {
  const WeightAgeCustomButton({
    Key? key,
    required this.icon,
    required this.updateCard,
    required this.type,
    required this.operation,
  }) : super(key: key);

  final Icon icon;
  final Function updateCard;
  final bool type;
  final bool operation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
        elevation: 10.0,
        constraints: const BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        shape: const CircleBorder(),
        fillColor: Colors.white10,
        child: icon,
        onPressed: () => updateCard(
          type: type,
          operation: operation,
        ),
      ),
    );
  }
}
