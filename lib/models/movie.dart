class Movie {
  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  bool isLiked;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.isLiked
  });

  factory Movie.fromJson(Map< String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      isLiked: false
    );
  }

  
}