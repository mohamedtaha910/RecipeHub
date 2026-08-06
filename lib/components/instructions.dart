import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.instructions});
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300.withAlpha(200),
          width: 0.7,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        instructions,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          height: 1.8,
          color: kSecondaryColor
        ),
      ),
    );
  }
}
