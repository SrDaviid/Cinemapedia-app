import '../../models/movie_models.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> getUpComingMovies({int page = 1});
  Future<List<Movie>> getTopRatedMovies({int page = 1});
  Future<Movie> getMovieById(String id);
}
