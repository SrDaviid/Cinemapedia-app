//Este datasource moviedb esta especializado y va ser concebido unicamente para trabajar y tener
// las interacciones con TheMovieDB

import 'package:dio/dio.dart';
import 'package:movie_app_2/config/environment/environment.dart';
import 'package:movie_app_2/models/movie_models.dart';
import 'package:movie_app_2/models/moviedb_response.dart';
import 'package:movie_app_2/services/datasources/movies_datasources.dart';
import 'package:movie_app_2/services/infrastructure/mappers/movie_mapper.dart';

class MoviedbDatasource extends MoviesDatasource {
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
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
