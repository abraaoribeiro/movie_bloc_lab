import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String posterUrl;
  final String description;
  final String releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  const MovieDetailPage({
    Key? key,
    required this.posterUrl,
    required this.description,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network("https://image.tmdb.org/t/p/w500$posterUrl",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
