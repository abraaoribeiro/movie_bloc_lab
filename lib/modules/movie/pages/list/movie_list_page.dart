import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_lab/modules/movie/cubit/movie.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is MovieErrorState){
            return const Center(
              child: Icon(Icons.close),
            );
          }else if(state is MovieSuccessState){
            final movies = state.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(movies[index].title),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index].urlImage),
                  ),
                ),
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}