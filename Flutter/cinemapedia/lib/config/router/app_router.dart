import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(childView: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeView()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesView(),
            ),
             GoRoute(
              path: '/popular',
              builder: (context, state) => const PopularView(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/movie/:id',
      name: MovieScreen.name,
      pageBuilder: (context, state) {
        final movieId = state.pathParameters['id'] ?? 'no-id';

        return CustomTransitionPage(
          key: state.pageKey,
          child: MovieScreen(movieId: movieId),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
