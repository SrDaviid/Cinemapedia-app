import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

// final searchedMoviesProvider = StateNotifierProvider<notifier, state>((ref) {});

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchedMoviesNotifier() : super([]);
}
