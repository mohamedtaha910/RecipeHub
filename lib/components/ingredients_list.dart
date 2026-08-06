import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/constant.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key, required this.ings, required this.qnt});
  final List<String> ings;
  final List<String> qnt;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ings.length < qnt.length ? ings.length : qnt.length,
      itemBuilder: (context, index) {
        return Container(

          padding: const EdgeInsets.symmetric(horizontal:16 ,vertical:10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey.shade300.withAlpha(150),
              width: 0.7,
            )
          ),
          child: Row(
            children: [
              // Ingredient Image
              Container(
                padding: const EdgeInsets.all(12),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(18),
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Image.network(
                  'https://www.themealdb.com/images/ingredients/${ings[index]}.png',
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.hide_image_rounded, color: Colors.black38, size: 28);
                  },
                ),
              ),
        
              const SizedBox(width: 18),
        
              // Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ings[index],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(10),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.grey.shade400.withAlpha(150),
                          width: 0.7
                        )
                      ),
                      child: Text(
                        qnt[index],
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) { 
        return const SizedBox(height: 12);
       },
    );
  }
}
