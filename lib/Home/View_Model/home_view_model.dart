import 'dart:convert';

import 'package:get/get.dart';

import 'package:movie_app/Utils/custom_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api_Services/check_connectivity.dart';
import '../Model/movie.dart';

class HomeViewModel extends GetxController {
  Rx<bool> isInternetConnected = false.obs;
  Rx<bool> isLiked = false.obs;
  Rx<Results> movie = Results().obs;
  late SharedPreferences prefs;
  RxList<Results> favouriteMovies = <Results>[].obs;

  @override
  void onInit() async {
    isInternetConnected.value = await CheckConnectivity.checkConnectivity();
    prefs = await SharedPreferences.getInstance();

    loadData();
    customPrint('internet status is ${isInternetConnected}');
    // TODO: implement onInit
    super.onInit();
  }



  Future<List<Results>> loadData() async {
    if(prefs!=null){
      prefs=await SharedPreferences.getInstance();
    }

    List<String>? listString = prefs!.getStringList('favourite');
    if (listString != null) {
      favouriteMovies.value = listString
          .map((item) => Results.fromJson(json.decode(item)))
          .toList();

      customPrint('length is in load data  ${favouriteMovies.value.length}');
    }
    return favouriteMovies.value; // Add this line to return the list as a future
  }

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    customPrint('save data in homeview');

    // Load existing favorite movies from shared preferences
    List<String>? listString = prefs.getStringList('favourite');
    if (listString != null) {
      favouriteMovies.value = listString
          .map((item) => Results.fromJson(json.decode(item)))
          .toList();
    } else {
      favouriteMovies.value = [];
    }

    // Check if the movie is already in the favorites list
    bool isMovieInFavorites = favouriteMovies.value.any((favMovie) => favMovie.title == movie.value.title);

    // Update the favorites list based on whether the movie is already in the list
    if (isMovieInFavorites) {
      favouriteMovies.value.removeWhere((favMovie) => favMovie.title == movie.value.title);
    } else {
      favouriteMovies.value.add(movie.value);
    }

    // Convert the updated list to JSON
    List<String> usrList = favouriteMovies.value.map((item) => jsonEncode(item.toJson())).toList();

    // Save the updated list to shared preferences
    prefs.setStringList("favourite", usrList);

    customPrint('save data completed in homeview');
    favouriteMoviesMatched();
  }



  favouriteMoviesMatched(){
    isLiked.value=false;
    for(int i=0;i<favouriteMovies.length;i++){
      customPrint('favourite movie is ${favouriteMovies.value[i].title} and ${movie.value.title}');
      if(favouriteMovies.value[i].title==movie.value.title){
        isLiked.value=true;
        customPrint('favourite movie is  is matched and ${favouriteMovies.value[i]==movie.value}');

      }
    }
  }
}
