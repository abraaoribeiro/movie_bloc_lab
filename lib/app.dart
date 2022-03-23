import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';
import 'package:movie_bloc_lab/modules/movie/pages/detail/movie_detail_page.dart';
import 'package:movie_bloc_lab/modules/movie/pages/list/movie_list.dart';
import 'package:movie_bloc_lab/modules/movie/pages/list/movie_list_page.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';
import 'package:movie_bloc_lab/shared/ErrorScreen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key, required IMovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(key: key);

  final IMovieRepository _movieRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: BlocProvider(
          create: (_) => MovieListCubit(movieRepository: _movieRepository),
          child: MovieAppPage()),
    );
  }
}

class MovieAppPage extends StatelessWidget {
  MovieAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }

  // TODO colocar com injeção de dependencia com o Get_it
  final _router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const MovieListPage(),
          routes: [
            GoRoute(
              path: 'list/detail',
              builder: (context, state) {
                final movieModel = state.extra as MovieModel;
                return MovieDetailPage(movieModel: movieModel);
              },
            ),
          ]
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
