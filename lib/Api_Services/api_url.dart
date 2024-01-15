import 'api_creds.dart';

class ApiUrls{
  static const String _baseUrl='https://api.themoviedb.org/3';

  static final String _popularMovies='${_baseUrl}/movie/popular?api_key=${ApiCredentials.apiKey}';
  static String get popularMovies => _popularMovies;
  static final String _latestMovies='${_baseUrl}/movie/upcoming?api_key=${ApiCredentials.apiKey}';
  static String get latestMovies => _latestMovies;
  static final String _topRated='${_baseUrl}/movie/top_rated?api_key=${ApiCredentials.apiKey}';
  static String get topRated => _topRated;


}