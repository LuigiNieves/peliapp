
import 'package:apiprueba/models/movie.dart';
import 'package:apiprueba/screens/home_screens';
import 'package:apiprueba/services/movie_service.dart';
import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized(); // Necesario para async antes de runApp
  final movies = await ApiService().getPopularMovies();
  for (var movie in movies) {
    print(movie.posterPath); // o print(movie)
  }
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
    // Future <List<Movie>> movies = ApiService().trendingData();
    // print(movies);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'peliApp',
      home: Scaffold(
        appBar: AppBar(title: Text('eledddna')),
        body: HomeScreen(),
      ),
    );
  }
}

