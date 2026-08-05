import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/meal_details_page.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.favMeal});
  final MealModel favMeal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealDetailsPage(meal: favMeal),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          // color: Colors.grey.withAlpha(78),
          color: Colors.grey.shade200,
          // color: Colors.black.withAlpha(100),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300.withAlpha(160), width: 0.6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: Image.network(
                favMeal.image,
                // fit: BoxFit.fill,
                fit: BoxFit.cover,
                width: 125,
                height: 128,
              ),
            ),
            SizedBox(width: 16),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                favMeal.name,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),

            SvgPicture.asset(
              'assets/icons/Arrow Right - Small.svg',
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
