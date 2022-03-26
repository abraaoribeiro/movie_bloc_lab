import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc_lab/config/app_route.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieAppPage();
  }
}


class MovieAppPage extends StatelessWidget {
  MovieAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = GetIt.instance.get<AppRouter>();

    return MaterialApp.router(
      routeInformationParser: _appRouter.router.routeInformationParser,
      routerDelegate: _appRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
