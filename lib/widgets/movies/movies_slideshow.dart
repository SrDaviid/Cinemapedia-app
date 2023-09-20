import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_2/models/models.dart';

class MoviesSlidershow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlidershow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        //This property allows me to see both card swiper (half and half)
        viewportFraction: 0.8,
        //This property sets a distance between these card swiper
        scale: 0.9,
        //This property
        autoplay: true,
        pagination: const SwiperPagination(
            margin: EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.indigo, color: Colors.black38)),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12));
                }

                return FadeIn(child: child);
              },
            )),
      ),
    );
  }
}
