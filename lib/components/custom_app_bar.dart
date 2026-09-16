import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/screens/profile_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  // SvgPicture.asset('assets/icons/Group.svg'),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      'assets/icons/chef-hat.png',
                      height: 28,
                    ),
                  ),
                  SizedBox(width: 5),
                  // SvgPicture.asset('assets/text/Good Morning.svg'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Dear',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey.shade500.withAlpha(200) , width: 0.8),
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        // height: 22,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade700,
                          BlendMode.srcIn,
                        ),
                        // height: 24,
                      ),
                    ),
                  ),
                  // SizedBox(width: 5),
                ],
              );
  }
}