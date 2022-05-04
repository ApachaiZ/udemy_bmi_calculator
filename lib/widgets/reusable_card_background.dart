import 'package:flutter/material.dart';

class ReusableCardBackground extends StatelessWidget {
  const ReusableCardBackground({
    Key? key,
    required this.color,
    this.cardChild,
  }) : super(key: key);

  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
