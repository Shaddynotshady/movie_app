import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../Utils/custom_print.dart';
import '../View_Model/home_view_model.dart';

class FavouriteMovieButton{
  final _homeViewModel=Get.put(HomeViewModel());
   favouriteMovieButton(){
    return LikeButton(
      isLiked: _homeViewModel.isLiked.value,
      onTap: (v) async {
        _homeViewModel.isLiked.value =
        !_homeViewModel.isLiked.value;
        customPrint('is is now ${_homeViewModel.isLiked.value}');


        await _homeViewModel.saveData();
        return !v;
      },
      size: 30,
      circleColor: const CircleColor(
          start: Color(0xff00ddff),
          end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          _homeViewModel.isLiked.value
              ? Icons.favorite
              : Icons.favorite_border,
          color:
          _homeViewModel.isLiked.value ? Colors.red : Colors.grey,
          size: 30,
        );
      },
    );
  }
}