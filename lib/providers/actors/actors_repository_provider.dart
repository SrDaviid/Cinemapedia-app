import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_2/services/infrastructure/datasources/actor_moviedb_datasource_impl.dart';
import 'package:movie_app_2/services/infrastructure/repositories/actor_repository_impl.dart';

//Este repositorio es SOLO LECTURA, funciona para consultar información
final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl( ActorMovieDbDatasource());
});
