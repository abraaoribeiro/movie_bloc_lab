import 'package:flutter/material.dart';
import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';

class MovieDetailPage extends StatelessWidget {

  final MovieModel movieModel;

  const MovieDetailPage({
    Key? key,
    required this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieModel.title.toString()),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network("https://image.tmdb.org/t/p/w500${movieModel.posterPath.toString()}",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            movieModel.overview.toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
