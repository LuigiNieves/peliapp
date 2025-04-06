import 'package:flutter/material.dart';
import 'package:apiprueba/services/movie_service.dart';
import 'package:apiprueba/models/movie.dart';
import 'package:apiprueba/widgets/movie_carousel.dart';
import 'package:apiprueba/widgets/movie_horizontal_list.dart';

class HomeScreenn extends StatelessWidget {
  const HomeScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiService();

    return Scaffold(
      appBar: AppBar(title: const Text('PeliApp')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSection('Populares', api.getPopularMovies(), useCarousel: true),
            _buildSection('Próximamente', api.getUpcomingMovies()),
            _buildSection('Top Rated', api.getTopRatedMovies()),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Future<List<Movie>> future, {bool useCarousel = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        FutureBuilder<List<Movie>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final movies = snapshot.data!;
              return useCarousel
                  ? MovieCarousel(movies: movies)
                  : MovieHorizontalList(movies: movies);
            }
          },
        ),
      ],
    );
  }
}
