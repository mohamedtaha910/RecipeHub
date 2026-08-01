import 'package:flutter/material.dart';
// import 'package:recipe_app/constant.dart';
import 'package:recipe_app/screens/country_meals.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/shimmers/countries_shimmer.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
                    future: RecipeServices().getCountries(),
                    builder: (context, snapShot) {
                      if(snapShot.connectionState == ConnectionState.waiting){
                        return CountriesShimmer();
                      }else if(snapShot.hasError){
                        return Center(child: Text('No countries found!'),);
                      }else if(snapShot.hasData){
                        List<String> countries = snapShot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: countries.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3.7
                          ),
                          itemBuilder:(context , index){
                            String country = countries[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CountryMeals(country: country,),));
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  // color: const Color.fromARGB(255, 176, 172, 172).withAlpha(80),
                                  // color: kLightColor.withAlpha(80),
                                  color: Colors.grey.shade200,
                                  // color: Color.fromARGB(255, 219, 221, 221),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300.withAlpha(200),
                                    width: 0.4,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      child: Text(country,style: TextStyle(color: Colors.black, fontSize: 13 , fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.chevron_right_rounded,color: Colors.black54,size: 22,)
                                  ],
                                ),
                              )
                            ); 
                                  
                          }
                        );
                         
                      }else{
                        return Center(child: Text('No Data'),);
                      }

                    }
                  );
  }
}