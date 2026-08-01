import 'package:flutter/material.dart';
// import 'package:recipe_app/constant.dart';

class CountriesShimmer extends StatelessWidget {
  const CountriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 28,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.7,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 176, 172, 172).withAlpha(80),
            // color: kLightColor.withAlpha(80),
            color: Colors.grey.shade200,
            // color: Color.fromARGB(255, 219, 221, 221),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                ' ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.chevron_right_rounded, color: Colors.black26, size: 22,),
            ],
          ),
        );
      },
    );
  }
}
