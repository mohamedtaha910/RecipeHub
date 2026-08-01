import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              shape: BoxShape.circle,
              // color: Colors.grey.shade200,
              border: Border.all(
                color: Colors.black.withAlpha(100),
                width: 0.6,
              ),
            ),
            child: Icon(icon, size: 32, color: Colors.black54),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
