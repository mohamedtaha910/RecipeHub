import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/components/details_row.dart';
import 'package:recipe_app/components/ingredients_list.dart';
import 'package:recipe_app/components/instructions.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_cubits.dart';
import 'package:recipe_app/models/detailed_meal_model.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/services/favourites_services.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key, required this.meal});
  final MealModel meal;

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  String currentBody = 'ing';
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: FutureBuilder(
          future: RecipeServices().getMealDetails(widget.meal.id),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Center(child: Text(snapShot.error.toString()));
            } else if (snapShot.hasData) {
              DetailedMealModel detailedMeal =
                  snapShot.data as DetailedMealModel;
              List<String> ings = detailedMeal.ingredients
                  .where((i) => i != '')
                  .toList();
              List<String> qnt = detailedMeal.quantity
                  .where((i) => i != '')
                  .toList();
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                // physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          // borderRadius: BorderRadiusGeometry.circular(6),
                          child: Image.network(
                            detailedMeal.image,
                            height: 384,
                            width: double.infinity,
                            // fit: BoxFit.fill,
                          ),
                        ),

                        /// back button

                        /// gradient
                        Positioned.fill(
                          // bottom: 0,
                          // height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white.withAlpha(220),
                                  Colors.white.withAlpha(120),
                                  Colors.white.withAlpha(80),
                                  Colors.white.withAlpha(20),
                                  Colors.white.withAlpha(10),
                                  Colors.white.withAlpha(0),
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,

                                  // Colors.black.withOpacity(0.6),
                                  // Colors.transparent,
                                ],
                                // stops: [
                                //   0,
                                //   0.2,
                                //   0.4,
                                //   0.55,
                                //   0.6,
                                //   0.7,
                                //   0.75,
                                //   0.8,
                                //   1,
                                // ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 16,
                          child: Text(
                            detailedMeal.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: EdgeInsets.all(1.8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                color: kSecondaryColor,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey.withAlpha(100),
                                    width: 0.8,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.chevron_left_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),

                        /// favourite button
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                FavouritesServices().addFavourite(widget.meal);
                                BlocProvider.of<FavCubit>(
                                  context,
                                ).fetchAllFav();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(16),
                                // color: Colors.black.withOpacity(0.4),
                                color: kSecondaryColor,
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey.withAlpha(100),
                                    width: 0.8,
                                  ),
                                ),
                              ),
                              child:
                                  FavouritesServices().isFavourite(
                                        widget.meal.id,
                                      ) ==
                                      true
                                  ? SvgPicture.asset(
                                      'assets/icons/Heart.svg',
                                      height: 28,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/Heart(1).svg',
                                        height: 23,
                                        colorFilter: ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Center(
                            child: Container(
                              width: 80,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(30),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          /// name
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 20),
                          //   child: Text(
                          //     detailedMeal.name,
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 32),

                          /// category
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                DetailsRow(
                                  text: detailedMeal.country,
                                  icon: Icons.flag_rounded,
                                ),
                                Spacer(),
                                DetailsRow(
                                  text: detailedMeal.category,
                                  icon: Icons.dinner_dining_rounded,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 24),
                          // video
                          GestureDetector(
                            onTap: () async {
                              final Uri url = Uri.parse(detailedMeal.video);

                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 28),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 42,
                              ),
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withAlpha(200),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Watch Video',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 24),

                          /// line
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 42),
                            height: 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(30),
                            ),
                          ),
                          SizedBox(height: 24),

                          /// ingredients and instructions
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentBody = 'ing';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 38,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: currentBody == 'ing'
                                            ? kSecondaryColor
                                            : Colors.grey.shade300,
                                      ),
                                      child: Text(
                                        'Ingredients',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: currentBody == 'ing'
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentBody = 'ins';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 38,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: currentBody == 'ins'
                                            ? kSecondaryColor
                                            : Colors.grey.shade300,
                                      ),
                                      child: Text(
                                        'Instructions',
                                        style: TextStyle(
                                          color: currentBody == 'ins'
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 24),

                          currentBody == 'ing'
                              ? IngredientsList(ings: ings, qnt: qnt)
                              : Instructions(
                                  instructions: detailedMeal.instruction,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
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
