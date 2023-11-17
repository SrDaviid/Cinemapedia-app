import 'package:dio/dio.dart';
import 'package:movie_app_2/models/models.dart';
import 'package:movie_app_2/services/datasources/actors_datasource.dart';
import 'package:movie_app_2/services/infrastructure/mappers/actor_mapper.dart';

import '../../../config/environment/environment.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieApiKey,
        'language': 'en-US'
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
