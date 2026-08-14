import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:recipe_app/constant.dart';
import 'package:recipe_app/screens/discover_page.dart';
import 'package:recipe_app/screens/favourite_page.dart';
import 'package:recipe_app/screens/home_page_body.dart';
import 'package:recipe_app/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePageBody(),
    // SearchPage(),
    DiscoverPage(isInHomePage: false),
    FavouritePage(isInProfile: false),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          pages[currentIndex],

      //     Positioned(
      //       // top: 100,
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       // height: 55,
      //       height: 63,
      //       child: Container(
      //         decoration: BoxDecoration(

      //           gradient: LinearGradient(
      //             begin: Alignment.bottomCenter,
      //             end: Alignment.topCenter,
      //             colors: [
      //               // Colors.red,
      //               // Colors.black,
      //               Colors.black.withAlpha(100),

      //               // kPrimaryColor.withAlpha(30),
      //               // kPrimaryColor,
      //               Colors.transparent,
      //               // Colors.white.withAlpha(0),
      //               // Colors.transparent,

      //               // Colors.yellow
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),

      //     Positioned(
      //       // height: 100,
      //       //  bottom: 0,  // => emulator
      //       bottom: 8, // => windows
      //       left: 6,
      //       right: 6,
      //       child: SafeArea(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 4),
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(18),
      //             child: NavigationBar(
      //               labelPadding: const EdgeInsets.all(0),
      //               // height: 63, // emulator
      //               height: 56, // => windows
      //               labelBehavior:
      //                   NavigationDestinationLabelBehavior.alwaysHide,
      //               animationDuration: Duration(milliseconds: 400),
      //               // indicatorColor: Colors.white.withAlpha(23),
      //               indicatorColor: const Color.fromARGB(255, 56, 75, 101),
      //               backgroundColor: const Color.fromARGB(255, 36, 52, 73),
      //               onDestinationSelected: (index) {
      //                 setState(() {
      //                   currentIndex = index;
      //                 });
      //               },
      //               selectedIndex: currentIndex,
      //               destinations: [

      //                 NavigationDestination(
      //                   // icon: Icon(Icons.home_outlined , ),
      //                   icon: SvgPicture.asset(
      //                     'assets/icons/Home (1).svg',
      //                     colorFilter: ColorFilter.mode(
      //                       Colors.white,
      //                       BlendMode.srcIn,
      //                     ),
      //                   ),
      //                   selectedIcon: SvgPicture.asset(
      //                     'assets/icons/Home_selected.svg',
      //                   ),
      //                   label: 'Home',
      //                 ),

      //                 NavigationDestination(
      //                   icon: SvgPicture.asset(
      //                     'assets/icons/Search.svg',
      //                     colorFilter: ColorFilter.mode(
      //                       Colors.white,
      //                       BlendMode.srcIn,
      //                     ),
      //                   ),
      //                   selectedIcon: SvgPicture.asset(
      //                     'assets/icons/Search (1)_selected.svg',
      //                   ),
      //                   label: 'Search',
      //                 ),

      //                 NavigationDestination(
      //                   icon: SvgPicture.asset(
      //                     'assets/icons/Heart.svg',
      //                     colorFilter: ColorFilter.mode(
      //                       Colors.white,
      //                       BlendMode.srcIn,
      //                     ),
      //                   ),
      //                   selectedIcon: SvgPicture.asset(
      //                     'assets/icons/Heart.svg',
      //                     colorFilter: ColorFilter.mode(
      //                       kPrimaryColor,
      //                       BlendMode.srcIn,
      //                     ),
      //                   ),
      //                   label: 'Favourites',
      //                 ),

      //                 NavigationDestination(
      //                   icon: SvgPicture.asset(
      //                     'assets/icons/Profile.svg',
      //                     colorFilter: ColorFilter.mode(
      //                       Colors.white,
      //                       BlendMode.srcIn,
      //                     ),
      //                   ),
      //                   selectedIcon: SvgPicture.asset(
      //                     'assets/icons/Profile (1)_selected.svg',
      //                   ),
      //                   label: 'Profile',
      //                 ),

      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        child: NavigationBar(
          labelPadding: const EdgeInsets.all(0),
          height: 63,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            // side: BorderSide(
            //   color: const Color.fromARGB(255, 56, 75, 101),
            //   width: 1,
            // ),
          ),
          animationDuration: Duration(milliseconds: 400),
          // indicatorColor: Colors.white.withAlpha(23),
          indicatorColor: const Color.fromARGB(255, 56, 75, 101),
          backgroundColor: const Color.fromARGB(255, 36, 52, 73),
          // backgroundColor: Colors.white,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex,
          destinations: [
            NavigationDestination(
              // icon: Icon(Icons.home_outlined , ),
              icon: SvgPicture.asset(
                'assets/icons/Menu Icon.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset('assets/icons/Home_selected.svg'),
              label: 'Home',
            ),

            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/Search.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/Search (1)_selected.svg',
              ),
              label: 'Search',
            ),

            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/Heart(1).svg',
                height: 22.6,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/Heart.svg',
                height: 26,
              ),
              label: 'Favourites',
            ),

            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                'assets/icons/Profile (1)_selected.svg',
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
