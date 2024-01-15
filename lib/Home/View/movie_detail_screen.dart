import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_app/Constant/app_textstyles.dart';
import 'package:movie_app/Home/View_Model/home_view_model.dart';
import 'package:movie_app/Utils/app_config.dart';
import 'package:movie_app/Utils/custom_print.dart';
import 'package:movie_app/Utils/sizedBoxPadding.dart';

import '../../Constant/app_color.dart';
import '../../Utils/shimmer_loading.dart';
import '../components/favourite_movie_button.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // final _homeViewModel = Get.find<HomeViewModel>();
  final _homeViewModel=Get.put(HomeViewModel());
  final _favouriteButton=FavouriteMovieButton();


  @override
  void initState() {
    _homeViewModel.favouriteMoviesMatched();

    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    // favouriteMovies();
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        return Stack(
          children: [
            SizedBox(
              height: constrains.maxHeight,
              width: constrains.maxWidth,
              child: CachedNetworkImage(
                imageUrl:
                    'http://image.tmdb.org/t/p/w500/${_homeViewModel.movie.value.posterPath}',
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
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: SizedBox(
                width: constrains.maxWidth,
                // color: Colors.purple,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxPadding.topPadding(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppConfig(context).width * 0.7,
                            child: Text(
                              '${_homeViewModel.movie.value.title}',
                              style: AppTextStyles.boldTextStyle
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Obx(() => Center(
                                  child:_favouriteButton.favouriteMovieButton() ,
                                )),
                          ),
                        ],
                      ),
                      Text(
                        'Rating: (${_homeViewModel.movie.value.voteAverage!.toStringAsFixed(1)} / 10)',
                        style: AppTextStyles.smallBoldTextStyle,
                      ),
                      SizedBoxPadding.sizedBoxHeight(),
                      SizedBox(
                        width: constrains.maxWidth,

                        // color: Colors.purple,
                        child: Text(
                          '${_homeViewModel.movie.value.overview}',
                          style: AppTextStyles.smallBoldTextStyle,
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBoxPadding.sizedBoxHeight(),
                      Row(
                        children: [
                          const Text(
                            'Release Date: ',
                            style: AppTextStyles.normalTextStyleBlue,
                          ),
                          Text(
                            '${_homeViewModel.movie.value.releaseDate}',
                            style: AppTextStyles.normalTextStyleBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
