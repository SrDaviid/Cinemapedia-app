import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_2/models/models.dart';
import 'package:movie_app_2/providers/providers.dart';
import '../../screens/delegates/search_movie_delegate.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon(
                Icons.movie_outlined,
                color: Colors.indigo,
              ),
              const SizedBox(width: 5),
              const Text(
                'Cinemapedia',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  //TODO:
                  // final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                        searchMovies: ref
                            .read(searchedMoviesProvider.notifier)
                            .searchMoviesByQuery),
                  ).then(
                    (movie) {
                      if (movie == null) return;
                      context.push('/movie/${movie.id}');
                    },
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 26,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
