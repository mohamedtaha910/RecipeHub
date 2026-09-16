import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/components/custom_app_bar.dart';
// import 'package:recipe_app/components/categories_list.dart';
// import 'package:recipe_app/components/countries_list.dart';
import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/components/search_bar.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/models/categories_model.dart';
import 'package:recipe_app/screens/discover_page.dart';
// import 'package:recipe_app/screens/category_meals.dart';
// import 'package:recipe_app/screens/search_page.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/shimmers/categories_shimmer.dart';
// import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/models/categories_model.dart';
// import 'package:recipe_app/services/recipe_services.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late String currentCategory = 'Beef';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              CustomAppBar(),

              SizedBox(height: 28),
              // search bar
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DiscoverPage(isInHomePage: true),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: CustomSearchBar(),
                ),
              ),

              SizedBox(height: 28),
              // SizedBox(height: 10,),
              //
              SvgPicture.asset('assets/text/Categories.svg', height: 16),

              SizedBox(height: 18),
              // CategoriesList(),
              FutureBuilder(
                future: RecipeServices().getCategories(),
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Center(child: Text('No categories found!'));
                  } else if (snapShot.data == null) {
                    return CategoriesShimmer();
                  } else if (snapShot.hasData) {
                    List<CategoriesModel> categories = snapShot.data!;
                    // currentCategory = categories[0].name!;

                    return SizedBox(
                      height: 33,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          CategoriesModel category = categories[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentCategory = category.name!;
                              });
                              // print(currentCategory);
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         CategoryMeals(category: category),
                              //   ),
                              // );
                            },
                            child: Container(
                              // height: 150,
                              // width: 150,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                // color: kLightColor.withAlpha(100),
                                color: category.name == currentCategory
                                    ? kPrimaryColor.withAlpha(230)
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Center(
                                child: Text(
                                  '${category.name}',
                                  style: TextStyle(
                                    // color: Colors.black,
                                    color: category.name == currentCategory
                                        ? Colors.white
                                        : Colors.black.withAlpha(150),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CategoriesShimmer();
                  }
                },
              ),

              SizedBox(height: 12),

              Expanded(
                child: Stack(
                  children: [
                    MealsGrid(
                      future: RecipeServices().getMealsByCategory(
                        currentCategory,
                      ),
                    ),
                    // shadow 
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white.withAlpha(100),
                              Colors.white.withAlpha(20),
                              Colors.white.withAlpha(0),
                            ],
                            begin: AlignmentGeometry.topCenter,
                            end: AlignmentGeometry.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
