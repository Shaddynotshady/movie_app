class Movie {
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  Movie(
      {int? page, List<Results>? results, int? totalPages, int? totalResults}) {
    if (page != null) {
      _page = page;
    }
    if (results != null) {
      _results = results;
    }
    if (totalPages != null) {
      _totalPages = totalPages;
    }
    if (totalResults != null) {
      _totalResults = totalResults;
    }
  }

  int? get page => _page;
  set page(int? page) => _page = page;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  Movie.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = _page;
    if (_results != null) {
      data['results'] = _results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = _totalPages;
    data['total_results'] = _totalResults;
    return data;
  }
}

class Results {
  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  Results(
      {bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        String? releaseDate,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount}) {
    if (adult != null) {
      _adult = adult;
    }
    if (backdropPath != null) {
      _backdropPath = backdropPath;
    }
    if (genreIds != null) {
      _genreIds = genreIds;
    }
    if (id != null) {
      _id = id;
    }
    if (originalLanguage != null) {
      _originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      _originalTitle = originalTitle;
    }
    if (overview != null) {
      _overview = overview;
    }
    if (popularity != null) {
      _popularity = popularity;
    }
    if (posterPath != null) {
      _posterPath = posterPath;
    }
    if (releaseDate != null) {
      _releaseDate = releaseDate;
    }
    if (title != null) {
      _title = title;
    }
    if (video != null) {
      _video = video;
    }
    if (voteAverage != null) {
      _voteAverage = voteAverage;
    }
    if (voteCount != null) {
      _voteCount = voteCount;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  String? get backdropPath => _backdropPath;
  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;
  List<int>? get genreIds => _genreIds;
  set genreIds(List<int>? genreIds) => _genreIds = genreIds;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get originalLanguage => _originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;
  String? get originalTitle => _originalTitle;
  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get title => _title;
  set title(String? title) => _title = title;
  bool? get video => _video;
  set video(bool? video) => _video = video;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;

  Results.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = _adult;
    data['backdrop_path'] = _backdropPath;
    data['genre_ids'] = _genreIds;
    data['id'] = _id;
    data['original_language'] = _originalLanguage;
    data['original_title'] = _originalTitle;
    data['overview'] = _overview;
    data['popularity'] = _popularity;
    data['poster_path'] = _posterPath;
    data['release_date'] = _releaseDate;
    data['title'] = _title;
    data['video'] = _video;
    data['vote_average'] = _voteAverage;
    data['vote_count'] = _voteCount;
    return data;
  }
}
