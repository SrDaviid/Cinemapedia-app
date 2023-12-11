import 'package:go_router/go_router.dart';
import 'package:movie_app_2/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
    // GoRoute(
    //   path: '/movie/:id',
    //   name: MovieScreen.name,
    //   builder: (context, state) {
    //     final movieId = state.pathParameters['id'] ?? 'no-id';
    //     return MovieScreen(movieId: movieId);
    //   },
    //  ),
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
