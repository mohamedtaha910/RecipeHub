import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/components/favourite_item.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_cubits.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_states.dart';
// import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/home_page.dart';
// import 'package:recipe_app/services/favourites_services.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key, required this.isInProfile});
  final bool isInProfile;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<MealModel> favMeals = [];

  @override
  void initState() {
    BlocProvider.of<FavCubit>(context).fetchAllFav();
    favMeals = BlocProvider.of<FavCubit>(context).favMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavStates>(
      
      builder: (context, state) {

        favMeals = BlocProvider.of<FavCubit>(context).favMeals;
        
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                // SizedBox(width: 8,),
                widget.isInProfile == true?
                IconButton(
                  onPressed: () {
                     Navigator.of(context).pop()  
                    ;
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 20,),
                ) : SizedBox.shrink(),
                // SizedBox(width: 10,),
                Text(
                  'My Favourites',
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),
                ),],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
            favMeals.isEmpty ? Center(
              child: Text('No favourite meals yet!')) :
             ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favMeals.length,
              itemBuilder: (context, i) {
                return FavouriteItem(favMeal: favMeals[i]);
              },
            ),
          ),
        );
      },
    );
  }
}
