import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/Home/Model/movie.dart';
import 'package:movie_app/Utils/custom_print.dart';

// import 'api_creds.dart';
import 'api_url.dart';
import 'base_api_services.dart';
import 'check_connectivity.dart';

class ApiServices extends BaseApiServices {
  const ApiServices();

  @override
  Future<Movie> getPopularMovies() async {
    try {
      bool isInternetConnected=await CheckConnectivity.checkConnectivity();
      customPrint('internet is ${isInternetConnected}');
      if(isInternetConnected==false){
        return Movie(results: []);
      }
      customPrint('popular movies check 1');
      final response = await http.get(
        Uri.parse(ApiUrls.popularMovies),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      customPrint('popular movies check 2 ${response.body.length}  \n it ends here=========');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        customPrint('response body length is ${response.body.length} and body is ${response.body}');


        Movie movie=Movie.fromJson(jsonResponse);


         return movie;
      } else {
        customPrint('popular movies check 5');
        return Movie(results: []);
        // API call failed, throw an exception with the error message
        throw Exception('API Call Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      return Movie(results: []);
      customPrint('popular movies check 6');
      // Handle any exceptions
      throw Exception('Error: $e');
    }
  }

  @override
  Future<Movie> getLatestMovies() async {
    try {

      customPrint('getLatestMovies movies check 1');
      final response = await http.get(
        Uri.parse(ApiUrls.latestMovies),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      customPrint('getLatestMovies movies check 2 ${response.body.length}  \n it ends here=========');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        customPrint('response body length is ${response.body.length} and body is ${response.body}');


        Movie movie=Movie.fromJson(jsonResponse);


         return movie;
      } else {
        customPrint('getLatestMovies movies check 5');
        return Movie(results: []);
        // API call failed, throw an exception with the error message
        throw Exception('API Call Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      return Movie(results: []);
      customPrint('popular movies check 6');
      // Handle any exceptions
      throw Exception('Error: $e');
    }
  }


  @override
  Future<Movie> getTopRated() async {
    try {

      customPrint('getTopRated movies check 1');
      final response = await http.get(
        Uri.parse(ApiUrls.topRated),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      customPrint('getTopRated movies check 2 ${response.body.length}  \n it ends here=========');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        customPrint('response body length is ${response.body.length} and body is ${response.body}');


        Movie movie=Movie.fromJson(jsonResponse);
        movie.results!.sort((a, b) => b.voteAverage!.compareTo(a.voteAverage!));



         return movie;
      } else {
        customPrint('getTopRated movies check 5');
        return Movie(results: []);
        // API call failed, throw an exception with the error message
        throw Exception('API Call Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      return Movie(results: []);
      customPrint('popular movies check 6');
      // Handle any exceptions
      throw Exception('Error: $e');
    }
  }

}
