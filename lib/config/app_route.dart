import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';
import 'package:movie_bloc_lab/modules/movie/pages/detail/movie_detail_page.dart';
import 'package:movie_bloc_lab/modules/movie/pages/list/movie_list_page.dart';
import 'package:movie_bloc_lab/shared/ErrorScreen.dart';

class AppRouter implements Disposable{

  final router = GoRouter(
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

  @override
  FutureOr onDispose() {
  }
}