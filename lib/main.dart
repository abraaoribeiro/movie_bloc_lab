import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_lab/app.dart';
import 'package:movie_bloc_lab/app_oberver.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/impl/movie_repository_impl.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MovieApp(movieRepository: MovieRepositoryImpl())),
    blocObserver: MovieAppObserver(),
  );
}

