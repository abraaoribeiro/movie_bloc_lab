import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'movie_list_cubit.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: BlocBuilder<MovieListCubit, MovieListState>(
          bloc: GetIt.I<MovieListCubit>(),
          builder: (context, state) {
            if (state is MovieListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieListErrorState) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is MovieListSuccessState) {
              return ListView.builder(
                itemCount: state.movieItemModel.movies?.length,
                itemBuilder: (context, index) {
                  final movie = state.movieItemModel.movies![index];
                  return InkResponse(
                    onTap: () => context.go('/list/detail', extra: movie),
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
}
