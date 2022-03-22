import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_lab/modules/movie/cubit/movie.dart';
import 'package:movie_bloc_lab/modules/movie/model/movie_item_model.dart';
import 'package:movie_bloc_lab/modules/movie/pages/detail/movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
        if (state is MovieLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieErrorState) {
          return const Center(
            child: Icon(Icons.close),
          );
        } else if (state is MovieSuccessState) {
          return ListView.builder(
            itemCount: state.movieItemModel.movies?.length,
            itemBuilder: (context, index) {
              final movie = state.movieItemModel.movies![index];
              return InkResponse(
                onTap: () => openDetailPage(movie, context),
                child: Card(
                  child: ListTile(
                    title: Text(movie.title.toString()),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://image.tmdb.org/t/p/w185${movie.posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Container();
      }),
    );
  }

  void openDetailPage(MovieModel movieModel, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(
            posterUrl: movieModel.posterPath.toString(),
            description: movieModel.overview.toString(),
            releaseDate: movieModel.releaseDate.toString(),
            title: movieModel.title.toString(),
            voteAverage: movieModel.voteAverage.toString(),
            movieId: movieModel.id!),
      ),
    );
  }
}
