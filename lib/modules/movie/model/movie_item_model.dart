class MovieItemModel {
  int? page;
  List<MovieModel>? movies;
  int? totalPages;
  int? totalResults;

  MovieItemModel({page, results, totalPages, totalResults});

  MovieItemModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies?.add(MovieModel.fromJson(v));
      });
    }

    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (movies != null) {
      data['results'] = movies?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? voteCount;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  double? voteAverage;
  bool? video;
  String? title;
  int? id;
  String? overview;
  String? releaseDate;
  double? popularity;
  String? mediaType;

  MovieModel(
      {
        adult,
        backdropPath,
        genreIds,
        voteCount,
        originalLanguage,
        originalTitle,
        posterPath,
        voteAverage,
        video,
        title,
        id,
        overview,
        releaseDate,
        popularity,
        mediaType
      });

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    voteCount = json['vote_count'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    video = json['video'];
    title = json['title'];
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['vote_count'] = voteCount;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['vote_average'] = voteAverage;
    data['video'] = video;
    data['title'] = title;
    data['id'] = id;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}