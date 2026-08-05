import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.text, required this.icon, required this.label});
  final String text;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22 , 
      vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300.withAlpha(200),
          width: 0.7,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
              border: Border.all(
                color: Colors.grey.shade400.withAlpha(200),
                width: 0.4,
              ),
            ),
            child: Icon(icon, size: 26, color: kSecondaryColor.withAlpha(200)),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(
                text == '' ? 'N/A' : text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
