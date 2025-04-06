import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apiprueba/models/movie.dart';

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MovieCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        enableInfiniteScroll: true,
      ),
      items: movies.map((movie) {
        return GestureDetector(
          onTap: () {
            // Navegar al detalle si lo deseas
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      movie.title,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
