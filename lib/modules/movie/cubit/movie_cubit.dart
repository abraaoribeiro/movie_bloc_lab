import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {

  MovieCubit({required this.movieRepository}) : super(MovieInitialState()){
    _getTrendingMovies();
  }

  final IMovieRepository movieRepository;

  void _getTrendingMovies() async {
    try {
      emit(MovieLoadingState());
      final movies = await movieRepository.findAll();
      emit(MovieSuccessState(movies));
    } catch (e) {
      emit(MovieErrorState());
    }
  }
}
