import 'package:flutter/material.dart';
import 'package:recipe_app/components/countries_list.dart';
import 'package:recipe_app/components/search_bar.dart';
import 'package:recipe_app/screens/home_page.dart';
import 'package:recipe_app/screens/search_page.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key, required this.isInHomePage});
  final bool isInHomePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            isInHomePage == true ?
            IconButton(
              onPressed: () {
                
                     Navigator.of(context).pop();
                    
              },
              icon: Icon(Icons.arrow_back_ios),
            ) : SizedBox.shrink(),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: CustomSearchBar(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Text(
                'Discover',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 24),
              CountriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
