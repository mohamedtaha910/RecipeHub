import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/constant.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({super.key, required this.ings, required this.qnt});
  final List<String> ings;
  final List<String> qnt;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ings.length < qnt.length ? ings.length : qnt.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color.fromARGB(255, 211, 220, 220),
          // color: Colors.grey.shade300,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Ingredient Image
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(18),
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      'https://www.themealdb.com/images/ingredients/${ings[index]}.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image_not_supported, color: Colors.grey.shade400, size: 26);
                      },
                    ),
                    
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
                          color: kSecondaryColor.withAlpha(40),
                          borderRadius: BorderRadius.circular(20),
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
          ),
        );
      },
    );
  }
}
