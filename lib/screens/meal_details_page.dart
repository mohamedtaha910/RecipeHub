import 'package:flutter/cupertino.dart';
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
                                  Colors.white.withAlpha(215),
                                  Colors.white.withAlpha(150),
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            child: Text(
                              detailedMeal.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black,
                              ),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          SizedBox(height: 32),
                      
                          /// category
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DetailsRow(
                                text: detailedMeal.country,
                                icon: Icons.flag_rounded,
                                label: 'Country',
                              ),
                              Spacer(),
                              // SizedBox(width: 12),
                              DetailsRow(
                                text: detailedMeal.category,
                                icon: Icons.dinner_dining_rounded,
                                label: 'Category',
                              ),
                            ],
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
                              // margin: EdgeInsets.symmetric(horizontal: 28),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                // horizontal: 42,
                              ),
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withAlpha(200),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    CupertinoIcons.play_circle_fill,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Watch Video',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
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
                            height: 1.4,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(30),
                            ),
                          ),
                          SizedBox(height: 24),
                      
                          /// ingredients and instructions
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
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
                                      width: (MediaQuery.of(context).size.width * 0.5) - 18,
                                      padding: EdgeInsets.symmetric(
                                        // horizontal: 38,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: currentBody == 'ing'
                                            ? kSecondaryColor.withAlpha(220)
                                            : Colors.grey.shade200,
                                      ),
                                      child: Text(
                                        'Ingredients',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: currentBody == 'ing'
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.6,
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
                                      width: (MediaQuery.of(context).size.width * 0.5)- 18,

                                      padding: EdgeInsets.symmetric(
                                        // horizontal: ,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: currentBody == 'ins'
                                            ? kSecondaryColor.withAlpha(220)
                                            : Colors.grey.shade200,
                                      ),
                                      child: Text(
                                        'Instructions',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: currentBody == 'ins'
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          letterSpacing: 0.6
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
