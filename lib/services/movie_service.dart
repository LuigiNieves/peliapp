import 'dart:convert';
// import 'package:apiprueba/constants.dart';
import 'package:apiprueba/constants.dart';
import 'package:apiprueba/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<Movie>> getPopularMovies() async {
    return _fetchMovies('${Constants.trendingUrl}');
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return _fetchMovies('${Constants.upcomingUrl}');
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return _fetchMovies('${Constants.topRateUrl}');
  }

  Future<List<Movie>> _fetchMovies(String urlMovie) async {
    // final url = Uri.parse(Constants.trendingUrl);
    final url = Uri.parse(urlMovie);
    // print(url);

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> listOfMovie = json.decode(response.body)['results'] as List;
        final movieList = listOfMovie.map((movie) => Movie.fromJson(movie)).toList();
        // print(movieList);
        return movieList;
      } else {
      
        throw Exception('Something happened');
      }
    } catch (error) {
      throw Exception('ocurrió un error procesando los datos del API');
    }
  }
}
