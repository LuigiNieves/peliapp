import 'package:apiprueba/constants.dart';
import 'package:apiprueba/widgets/like_button.dart';
import 'package:flutter/material.dart';
import 'package:apiprueba/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}



class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Movie movie;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  } 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  '${Constants.imagePath}${movie.backDropPath ?? movie.posterPath}',
                ),
                const Icon(
                  Icons.play_circle_fill,
                  color: Color.fromARGB(255, 200, 196, 196),
                  size: 72,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Date: ${widget.movie.releaseDate}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '⭐️ ${movie.voteAverage.toString()}',
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LikeButton(
                movie: widget.movie,
                onChanged: (value) {
                  setState(() {
                    movie.isLiked = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
