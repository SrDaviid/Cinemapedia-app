import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_2/providers/providers.dart';
import '../../models/movie_models.dart';

final moviesSlidershowProvider = Provider<List<Movie>>((ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) return [];
    return nowPlayingMovies.sublist(0, 6);
  },
);
