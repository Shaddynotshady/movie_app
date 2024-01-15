import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Home/View_Model/home_view_model.dart';
import 'package:movie_app/Home/components/movie_card.dart';

import '../../Constant/app_color.dart';
import '../../Utils/sizedBoxPadding.dart';

class FavouriteMovies extends StatefulWidget {
  const FavouriteMovies({super.key});

  @override
  State<FavouriteMovies> createState() => _FavouriteMoviesState();
}

class _FavouriteMoviesState extends State<FavouriteMovies> {
  final _homeViewModel=Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: LayoutBuilder(
        builder: (context,constrains) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              children: [
                SizedBoxPadding.topPadding(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyText),
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(Icons.settings),
                      ),
                    ),
                    SizedBoxPadding.sizedBoxWidth(),
                  ],
                ),

                Expanded(
                  child: Obx(() => SizedBox(
                    // height: constrains.maxHeight*0.8,
                    width: constrains.maxWidth*0.8,
                    child: GridView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Set the number of columns as per your requirement
                          crossAxisSpacing: 0.0, // Set the spacing between columns
                          mainAxisSpacing: 8.0, // Set the spacing between rows
                          childAspectRatio: 0.8),
                      itemCount: _homeViewModel.favouriteMovies.value.length,
                      itemBuilder: (BuildContext context, int index) {

                        return MovieCard.movieCardPopular(_homeViewModel.favouriteMovies.value[index]);
                      },
                    ),
                  )),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
