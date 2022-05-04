import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.genderIcon,
    required this.gender,
    required this.color,
  }) : super(key: key);

  final IconData genderIcon;
  final String gender;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          color: color,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
