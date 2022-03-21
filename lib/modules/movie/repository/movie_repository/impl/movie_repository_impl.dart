
import 'dart:convert';

import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements IMovieRepository {

  final url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

  @override
  findAll() async {
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      final moviesItem = MovieItemModel.fromJson(response.data);
      return moviesItem;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
