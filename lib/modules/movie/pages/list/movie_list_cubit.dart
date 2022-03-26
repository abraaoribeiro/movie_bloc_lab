import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';

import '../../model/movie_item_model.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> implements Disposable {
  MovieListCubit({required this.movieRepository}) : super(MovieListInitialState()){
    _getTrendingMovies();
  }

  IMovieRepository movieRepository;

  void _getTrendingMovies() async {
    try {
      emit(MovieListLoadingState());
      final movieItemModel = await movieRepository.findAll();

      emit(MovieListSuccessState(movieItemModel));
    } catch (e) {
      emit(MovieListErrorState());
    }
  }

  @override
  FutureOr onDispose() {
    print("Disponse Cubit");
  }
}
