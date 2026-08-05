import 'package:flutter/material.dart';
// import 'package:recipe_app/constant.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                
                return Shimmer(
                  child: Container(
                    height: 50,
                    width: 80,
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: kLightColor.withAlpha(100),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    
                    ),
                  
                  ),
                );
              },
            ),
          );
  }
}