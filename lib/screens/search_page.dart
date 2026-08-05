import 'package:flutter/material.dart';
import 'package:recipe_app/components/favourite_item.dart';
// import 'package:recipe_app/components/favourite_item.dart';
// import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/models/meal_model.dart';
// import 'package:recipe_app/components/favourite_item.dart';
// import 'package:recipe_app/components/meals_grid.dart';
// import 'package:recipe_app/models/meal_model.dart';
// import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/services/recipe_services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String mealName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            color: Colors.grey.shade300.withAlpha(200),
            height: 0.4,
          ),
        ),
        // toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only( top:16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black54,
                  size: 34,
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      mealName = value;
                    });
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Text(
                      'Search a meal',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: mealName.isEmpty || mealName == ''
          ? Center(
              child: Text(
                'Search a meal',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // child: MealsGrid(future: RecipeServices().searchMeals(mealName)),
              child: FutureBuilder(
                future: RecipeServices().searchMeals(mealName),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapShot.hasError) {
                    return Center(
                      child: Text(
                        'There is No Meals ! ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    );
                  } else if (snapShot.data == null) {
                    return Center(child: Text('No Data'));
                  } else if (snapShot.hasData) {
                    List<MealModel> meals = snapShot.data!;
                    return ListView.builder(
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        MealModel meal = meals[index];
                        return FavouriteItem(favMeal: meal);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
    );
  }
}
