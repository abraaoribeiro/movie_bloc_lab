import 'package:go_router/go_router.dart';
import 'package:movie_bloc_lab/modules/movie/pages/list/movie_list_page.dart';

class AppRouter{

  final router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MovieListPage(),
      ),
    ],
  );
}