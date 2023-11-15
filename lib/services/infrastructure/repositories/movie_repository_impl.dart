import 'package:movie_app_2/models/models.dart';
import 'package:movie_app_2/services/datasources/movies_datasources.dart';
import 'package:movie_app_2/services/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return datasource.getPopularMovies(page: page);
  }

  @override
  Future<List<Movie>> getUpComingMovies({int page = 1}) {
    return datasource.getUpComingMovies(page: page);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    return datasource.getTopRatedMovies(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
}
