import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final initialScreenLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(moviesSlidershowProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(upcomingMoviesProvider).isEmpty;
  final step4 = ref.watch(topRatedMoviesProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  //End loading screen process
  return false;
});
