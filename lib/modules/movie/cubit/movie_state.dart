part of 'movie_cubit.dart';

@immutable
abstract class MovieState extends Equatable{}

class MovieInitialState extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieSuccessState extends MovieState {

  MovieSuccessState(this.movieItemModel);

  final MovieItemModel movieItemModel;

  @override
  List<Object?> get props => [movieItemModel];
}

class MovieErrorState extends MovieState {

  @override
  List<Object?> get props => [];
}
