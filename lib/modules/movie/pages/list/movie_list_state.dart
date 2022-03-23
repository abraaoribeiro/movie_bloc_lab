part of 'movie_list_cubit.dart';

@immutable
abstract class MovieListState extends Equatable{}

class MovieListInitialState extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListLoadingState extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListSuccessState extends MovieListState {

  MovieListSuccessState(this.movieItemModel);

  final MovieItemModel movieItemModel;

  @override
  List<Object?> get props => [movieItemModel];
}

class MovieListErrorState extends MovieListState {

  @override
  List<Object?> get props => [];
}