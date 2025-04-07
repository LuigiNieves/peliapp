import 'package:flutter/material.dart';
import 'package:apiprueba/models/movie.dart';

class LikeButton extends StatefulWidget {
  final Movie movie;
  final Function(bool) onChanged;

  const LikeButton({
    super.key,
    required this.movie,
    required this.onChanged,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  void _toggleLike() {
    setState(() {
      widget.movie.isLiked = !widget.movie.isLiked;
    });
    widget.onChanged(widget.movie.isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.movie.isLiked ? Icons.favorite : Icons.favorite_border,
        color: widget.movie.isLiked ? Colors.red : Colors.black, // borde negro
      ),
      onPressed: _toggleLike,
    );
  }
}
