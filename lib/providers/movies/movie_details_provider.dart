import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_2/providers/providers.dart';
import '../../models/models.dart';

final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    //If I already have the movieId I return nothing
    if (state[movieId] != null) return;
    //If I don't have the MovieId
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
