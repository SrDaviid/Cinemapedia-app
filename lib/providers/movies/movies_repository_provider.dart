import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_2/services/infrastructure/datasources/moviedb_datasource.impl.dart';
import 'package:movie_app_2/services/infrastructure/repositories/movie_repository_impl.dart';

//Este repositorio es SOLO LECTURA, funciona para consultar información
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
