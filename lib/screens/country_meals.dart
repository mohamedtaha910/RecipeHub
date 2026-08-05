import 'package:flutter/material.dart';
import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/models/meal_model.dart';
// import 'package:recipe_app/screens/meal_details.dart';
import 'package:recipe_app/services/recipe_services.dart';

class CountryMeals extends StatelessWidget {
  const CountryMeals({super.key, required this.country});
  final String country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.grey.shade300.withAlpha(200),
          ),
        ),

        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // SizedBox(width: 8,),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.black54),
            ),
            // SizedBox(width: 10,),
            Text(
              country.toString(),
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),
            ),
            Text(' Meals', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MealsGrid(future: RecipeServices().getMealsByCountry(country)),
      ),
    );
  }
}
