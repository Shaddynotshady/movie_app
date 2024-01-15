import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_app/Home/View_Model/home_view_model.dart';
import 'package:movie_app/Utils/sizedBoxPadding.dart';
import 'package:shimmer/shimmer.dart';

import '../../Constant/app_color.dart';
import '../../Constant/app_textstyles.dart';
import '../../Utils/app_config.dart';
import '../../Utils/custom_print.dart';
import '../../Utils/shimmer_loading.dart';
import '../Model/movie.dart';
import '../View/movie_detail_screen.dart';

class MovieCard {

  static final _homeViewModel=Get.put(HomeViewModel());
  static movieCardTopRated(BuildContext context,Results result) {
    return InkWell(
      onTap: (){

        _homeViewModel.movie.value=result;
        customPrint('length is in load data value is  ${_homeViewModel.favouriteMovies.value.first.title} and ${_homeViewModel.movie.value.title}');

        if(_homeViewModel.favouriteMovies.value.contains(result)){
          customPrint('its contains');
          _homeViewModel.isLiked.value=true;
        }else{
          customPrint('its contains not');
          _homeViewModel.isLiked.value=false;
        }
        Get.to(()=>const MovieDetailScreen());
      },
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 93,
                        width: 96,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.white)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: 'http://image.tmdb.org/t/p/w500/${result.posterPath}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                ShimmerLoading.loadImage(),
                            errorWidget: (context, url, error) => Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade100),
                                child: const Center(child: Icon(Icons.error))),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                       width: AppConfig(context).width * 0.6,
                       child: Text(
                        '${result.title}',
                        style: AppTextStyles.userHomeScreen,
                         overflow: TextOverflow.ellipsis,
                                         ),
                     ),
                    SizedBox(
                      width: AppConfig(context).width * 0.6,
                      child: Text(
                        '${result.overview}',
                        style: AppTextStyles.normalTextStyleGrey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: AppConfig(context).width - 160,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Rating: ${result.voteAverage!.toStringAsFixed(1)} / 10'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  static movieCardPopular(Results result) {
    return InkWell(
      onTap: (){
        if(_homeViewModel.isInternetConnected.value==false){
          Fluttertoast.showToast(msg: 'check your internet connection');
          return;
        }
        _homeViewModel.movie.value=result;
        Get.to(()=>const MovieDetailScreen());
      },
      child: SizedBox(
        height: 210,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 210,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CachedNetworkImage(
                      imageUrl:
                          'http://image.tmdb.org/t/p/w500/${result.posterPath}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ShimmerLoading.loadImage(),
                      errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  width: 130,
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.grey.withOpacity(0.2),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        // AppColors.blackText.withOpacity(0.9),
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        AppColors.transparentColor,
                        AppColors.transparentColor,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              "${result.title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.normalTextStyleWhite,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: Text(
                              "${result.overview}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.smallTextStyleWhite
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static movieCardPopularShimmer() {
    return shimmerEffect(
        child: SizedBox(
          height: 210,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 210,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                        imageUrl:
                        'http://image.tmdb.org/t/p/w500/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ShimmerLoading.loadImage(),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(color: Colors.grey.shade100),
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 210,
                    width: 130,
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.grey.withOpacity(0.2),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.blackText.withOpacity(0.9),
                          AppColors.blackText,
                          AppColors.transparentColor,
                          AppColors.transparentColor,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              child: Text(
                                "Welcome",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.normalTextStyleWhite,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Text(
                                "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.smallTextStyleWhite
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }

  static movieCardTopRatedShimmer(BuildContext context){
    return shimmerEffect(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 93,
                        width: 96,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.white)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: 'http://image.tmdb.org/t/p/w500/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                ShimmerLoading.loadImage(),
                            errorWidget: (context, url, error) => Container(
                                decoration:
                                BoxDecoration(color: Colors.grey.shade100),
                                child: const Center(child: Icon(Icons.error))),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerEffect(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteBackground,
                        ),

                        width: 80,
                        height: 20,
                        child: Text(
                          '    ',
                          style: AppTextStyles.userHomeScreen,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBoxPadding.sizedBoxHeight(),
                    shimmerEffect(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteBackground,
                        ),

                        width: 80,
                        height: 20,
                        child: Text(
                          '    ',
                          style: AppTextStyles.userHomeScreen,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBoxPadding.sizedBoxHeight(),
                    shimmerEffect(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteBackground,
                        ),

                        width: 80,
                        height: 20,
                        child: Text(
                          '    ',
                          style: AppTextStyles.userHomeScreen,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  static shimmerEffect({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey[300]!,
      child: child,
    );
  }
}
