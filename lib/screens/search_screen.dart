import 'package:apiprueba/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:apiprueba/models/movie.dart';
import 'package:apiprueba/services/movie_service.dart';
import 'package:apiprueba/widgets/movie_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> _allMovies = [];
  List<Movie> _filteredMovies = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final movies = await ApiService().getPopularMovies(); // O trendingData()
      setState(() {
        _allMovies = movies;
        _filteredMovies = movies;
        _isLoading = false;
      });
    } catch (e) {
      // print('Error cargando películas: $e');
      setState(() => _isLoading = false);
    }
  }

  void _filterMovies(String query) {
    final filtered =
        _allMovies.where((movie) {
          final titleLower = movie.title.toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower);
        }).toList();

    setState(() => _filteredMovies = filtered);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar película')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _filterMovies,
              decoration: InputDecoration(
                hintText: 'Escribe para buscar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
  ? const CircularProgressIndicator()
  : _controller.text.isEmpty
      ? const SizedBox() // No mostrar nada si no hay texto
      : _filteredMovies.isEmpty
          ? const Text('No se encontraron coincidencias.')
          : Expanded(
              child: ListView.builder(
                itemCount: _filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = _filteredMovies[index];
                  return MovieListTile(
                    movie: movie,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailScreen(movie: movie),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
