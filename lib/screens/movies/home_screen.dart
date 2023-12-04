import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_app_2/providers/providers.dart';
import 'package:movie_app_2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialScreenLoading = ref.watch(initialScreenLoadingProvider);
    if (initialScreenLoading) return FullScreenLoader();

    //Providers
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlidershowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      // The slivers works directly with scroll view
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviesSlidershow(movies: slideShowMovies),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'In Theaters',
                  subTitle: getDayOfWeek(),
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Popular Movies',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Coming Soon',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Top Rating',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 10),
                //   child: Text(
                //     "Maria Fernanda's movies",
                //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                //   ),
                // ),
                // SizedBox(
                //   height: 300,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 4,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         padding: const EdgeInsets.all(8),
                //         width: 135,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             FadeInRight(
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(20),
                //                 child: Image.network(
                //                   'https://resources.booztcdn.com/357096-1663144073_rev1BarbieInstaVertHighResJPEG.webp',
                //                   height: 200,
                //                   width: 135,
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }

  String getDayOfWeek() {
    DateTime now = DateTime.now();
    String dayOfWeek = DateFormat('EEEE').format(now);
    return dayOfWeek;
  }
}
