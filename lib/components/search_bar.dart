import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:recipe_app/constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // color: Colors.grey.withAlpha(100),
        // color: kLightColor.withAlpha(80),
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.grey.shade300.withAlpha(200),
          width: 0.4,
        ),
      ),

      child: Row(
        children: [
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/Search.svg',
            colorFilter: ColorFilter.mode(
              Colors.grey.shade600,
              BlendMode.srcIn,
              
            ),
            height: 22,
          ),
          // Icon(Icons.search,color: Colors.black.withAlpha(100)),
          SizedBox(width: 16),
          Text(
            'Search meals',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
