
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/Home/View/favourite_movies.dart';
import 'package:movie_app/Home/View/home_page.dart';


import '../../../Constant/app_color.dart';
import '../../../Constant/app_images.dart';

import '../../../Utils/custom_print.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({this.uid, this.currentIndex = 0, super.key});
  String? uid;
  int currentIndex;
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const FavouriteMovies(),
  ];
  int exitApp = 0;

  void onTaped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              selectedLabelStyle: TextStyle(fontSize: 0),
              unselectedFontSize: 0,
              unselectedItemColor: Colors.black38,
              selectedItemColor: AppColors.buttonColor,
              backgroundColor: AppColors.whiteBackground,
              // type:BottomNavigationBarType.fixed ,
              onTap: onTaped,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon:Icon(Icons.home_filled),
                    // ignore: deprecated_member_use
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    // ignore: deprecated_member_use
                    label: ''),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
