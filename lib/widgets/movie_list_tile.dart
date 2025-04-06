import 'package:apiprueba/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:apiprueba/models/movie.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieListTile({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
        width: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
      ),
      title: Text(movie.title),
      subtitle: Text('Popularidad: ${movie.voteAverage.toStringAsFixed(1)}'),
      onTap: (){
        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailScreen(movie: movie),
                  ),
                );
      },
    );
  }
}
