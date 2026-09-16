import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:recipe_app/constant.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_cubits.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/meal_details_page.dart';
import 'package:recipe_app/services/favourites_services.dart';
import 'package:recipe_app/shimmers/meals_grid_shimmer.dart';
// import 'package:recipe_app/services/recipe_services.dart';

class MealsGrid extends StatefulWidget {
  const MealsGrid({super.key, required this.future});
  final Future<List<MealModel>> future;

  @override
  State<MealsGrid> createState() => _MealsGridState();
}

class _MealsGridState extends State<MealsGrid> {
  @override
  Widget build(BuildContext context) {
    // double borderRadius = 14;
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return MealsGridShimmer();
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
        } else if (snapShot.hasData) {
          List<MealModel> meals = snapShot.data!;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 24),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    MealModel meal = meals[index];
                    // return GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => MealDetailsPage(meal: meal),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     // height: 500,
                    //     margin: EdgeInsets.only(bottom: 2),
                    //     // padding: EdgeInsets.only(bottom: 8 , ),

                    //     decoration: BoxDecoration(

                    //       borderRadius: BorderRadius.circular(borderRadius),

                    //       // color: Color(0xFFE5E5E5),
                    //       color: Colors.grey.shade200,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black.withAlpha(50),
                    //           offset: Offset(0, 2),
                    //           blurRadius: 4,
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Expanded(
                    //           child: Stack(
                    //             children: [
                    //               ClipRRect(
                    //                 borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(borderRadius),
                    //                   topRight: Radius.circular(borderRadius),
                    //                 ),
                    //                 child: Image.network(
                    //                   // height: 500,
                    //                   meal.image,
                    //                   // fit: BoxFit.cover,
                    //                   width: double.infinity,
                    //                 ),
                    //               ),
                    //               Positioned(
                    //                 top: 8,
                    //                 right: 8,
                    //                 // left: 0,
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     FavouritesServices().addFavourite(meal);
                    //                     BlocProvider.of<FavCubit>(
                    //                       context,
                    //                     ).fetchAllFav();
                    //                     setState(() {});
                    //                   },
                    //                   child: FavouritesServices().isFavourite(meal.id)
                    //                       ? SvgPicture.asset(
                    //                           'assets/icons/Heart.svg',
                    //                           height: 27,
                    //                         )
                    //                       : SvgPicture.asset(
                    //                           'assets/icons/Heart(1).svg',
                    //                           height: 22,
                    //                           colorFilter: ColorFilter.mode(
                    //                             Colors.white,
                    //                             BlendMode.srcIn,
                    //                           ),
                    //                         ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         // SizedBox(height: 12),
                    //         // Container(
                    //         //   margin: EdgeInsets.symmetric(horizontal: 28),
                    //         //   height: 1.5,
                    //         //   width: double.infinity,
                    //         //   decoration: BoxDecoration(
                    //         //     // color: Colors.black54,
                    //         //     color: Colors.black.withAlpha(50),
                    //         //     borderRadius: BorderRadius.circular(12),
                    //         //   ),
                    //         // ),
                    //         SizedBox(height: 8),
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             meal.name.length > 15
                    //                 ? '${meal.name.substring(0, 15)}...'
                    //                 : meal.name,
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MealDetailsPage(meal: meal),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 170,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              // color: Colors.grey.shade200,
                              border: Border.all(
                                color: Colors.grey.shade300.withAlpha(240),
                                width: 0.9,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 10,
                                //     offset: Offset(0, 5),
                                //   ),
                                // ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ///  Image
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.network(
                                        meal.image,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Icon(
                                                Icons
                                                    .image_not_supported_rounded,
                                              );
                                            },
                                    
                                      ),
                                    ),
                                  ),

                                  ///  Gradient Overlay
                                  // Positioned.fill(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       gradient: LinearGradient(
                                  //         colors: [
                                  //           Colors.transparent,
                                  //           Colors.black.withOpacity(0.9),
                                  //         ],
                                  //         begin: Alignment.topCenter,
                                  //         end: Alignment.bottomCenter,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  ///  Favourite Button
                                  Positioned(
                                    top: -2,
                                    right: -2,
                                    child: GestureDetector(
                                      onTap: () {
                                        FavouritesServices().addFavourite(meal);
                                        BlocProvider.of<FavCubit>(
                                          context,
                                        ).fetchAllFav();
                                        setState(() {});
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.9,
                                              ),
                                              // color: Colors.white,
                                            ),
                                            child:
                                                FavouritesServices()
                                                    .isFavourite(meal.id)
                                                ? SvgPicture.asset(
                                                    'assets/icons/Heart.svg',
                                                    height: 22,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icons/Heart(1).svg',
                                                    height: 20,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          Colors.black87,
                                                          BlendMode.srcIn,
                                                        ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meal.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return MealsGridShimmer();
        }
      },
    );
  }
}
