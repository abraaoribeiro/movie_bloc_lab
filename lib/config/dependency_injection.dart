import 'package:get_it/get_it.dart';
import 'package:movie_bloc_lab/config/app_route.dart';
import 'package:movie_bloc_lab/modules/movie/movie_export.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/impl/movie_repository_impl.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';

final getIt = GetIt.instance;

void configureDependencies() {

  getIt.registerFactory(() => AppRouter());

  // Services Injection
  getIt.registerSingleton<IMovieRepository>(MovieRepositoryImpl());

  // Cubits Injection
  getIt.registerLazySingleton(() => MovieListCubit(movieRepository: getIt<IMovieRepository>()));

}