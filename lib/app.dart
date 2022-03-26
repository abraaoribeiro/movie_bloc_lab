import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc_lab/config/app_route.dart';
import 'package:movie_bloc_lab/config/dependency_injection.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieAppPage();
  }
}


class MovieAppPage extends StatefulWidget {
  MovieAppPage({Key? key}) : super(key: key);

  @override
  State<MovieAppPage> createState() => _MovieAppPageState();

}

class _MovieAppPageState extends State<MovieAppPage> {

  @override
  void dispose() {
    super.dispose();
    disponseModule();
  }

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
