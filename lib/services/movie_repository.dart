import '../models/movie.dart';

class MovieRepository {
  static final MovieRepository _instance = MovieRepository._internal();

  factory MovieRepository() => _instance;

  MovieRepository._internal();

  List<Movie> popularMovies = [];
}