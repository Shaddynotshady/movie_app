import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_app/Constant/app_images.dart';
import 'package:movie_app/Home/View_Model/home_view_model.dart';
import 'package:movie_app/Home/components/movie_card.dart';
import 'package:movie_app/Utils/app_config.dart';
import 'package:movie_app/Utils/sizedBoxPadding.dart';

import '../../Api_Services/api_services.dart';
import '../../Constant/app_color.dart';
import '../../Constant/app_textstyles.dart';
import '../../Utils/custom_print.dart';

import '../Model/movie.dart';
import '../components/internet_connection_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _apiServices = const ApiServices();

  final _homeViewModel=Get.put(HomeViewModel());

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(builder: (context, constraint) {
        customPrint('layout builder ${constraint}');
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Obx(() => _homeViewModel.isInternetConnected.value==false?
                InternetConnection.interNetConnection():
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular Movies',
                      style: AppTextStyles.userHomeScreen,
                    ),
                    SizedBoxPadding.sizedBoxHeight(),
                    FutureBuilder<Movie?>(
                      future: _apiServices.getPopularMovies(),
                      builder:
                          (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          customPrint('Error: ${snapshot.error}');
                          return const Text('No Movies Found',style: AppTextStyles.smallTextStyleBlack,);
                        }
                        Movie movies = snapshot.data!;
                        customPrint('movies are ${movies.results!.length}');

                        return SizedBox(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.results!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: MovieCard.movieCardPopular(movies.results![index]),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBoxPadding.sizedBoxHeight(height: 20),
                    const Text(
                      'Upcoming Movies',
                      style: AppTextStyles.userHomeScreen,
                    ),
                    SizedBoxPadding.sizedBoxHeight(),
                    FutureBuilder<Movie?>(
                      future: _apiServices.getLatestMovies(),
                      builder:
                          (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopularShimmer(),
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          customPrint('Error: ${snapshot.error}');
                          return const Text('No Movies Found',style: AppTextStyles.smallTextStyleBlack,);
                        }
                        Movie movies = snapshot.data!;
                        customPrint('movies are ${movies.results!.length}');

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...movies.results!.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: MovieCard.movieCardPopular(e),
                                );
                              })
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBoxPadding.sizedBoxHeight(height: 20),
                    const Text(
                      'Top Rated',
                      style: AppTextStyles.userHomeScreen,
                    ),
                    SizedBoxPadding.sizedBoxHeight(),
                    FutureBuilder<Movie?>(
                      future: _apiServices.getTopRated(),
                      builder:
                          (BuildContext context, AsyncSnapshot<Movie?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: MovieCard.movieCardTopRatedShimmer(context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: MovieCard.movieCardTopRatedShimmer(context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: MovieCard.movieCardTopRatedShimmer(context),
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          customPrint('Error: ${snapshot.error}');
                          return const Text('No Movies Found',style: AppTextStyles.smallTextStyleBlack,);
                        }
                        Movie movies = snapshot.data!;
                        customPrint('movies are ${movies.results!.length}');

                        return Column(
                          children: [

                            ...movies.results!.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: MovieCard.movieCardTopRated(context,e),
                              );
                            })
                          ],
                        );
                      },
                    ),
                  ],))

              ],
            ),
          ),
        );
      }),
    );
  }
}
