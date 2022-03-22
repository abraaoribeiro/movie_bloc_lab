import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_lab/modules/movie/cubit/movie_cubit.dart';
import 'package:movie_bloc_lab/modules/movie/pages/list/movie_list_page.dart';
import 'package:movie_bloc_lab/modules/movie/repository/movie_repository/movie_repository_interface.dart';

class MovieApp extends StatelessWidget {
   const MovieApp({Key? key, required IMovieRepository movieRepository}) :
  _movieRepository = movieRepository,
  super(key: key);


  final IMovieRepository _movieRepository;
  
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: BlocProvider(
        create: (_) =>  MovieCubit(movieRepository: _movieRepository),
        child: const MovieAppPage()),
    );
  }
}

class MovieAppPage extends StatelessWidget {
 const MovieAppPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MovieListPage(),
      );
  }
}
