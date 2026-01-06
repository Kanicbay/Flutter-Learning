import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  ConsumerState<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends ConsumerState<PopularView> {
  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);

    if (popularMovies.isEmpty) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    return Scaffold(
      body: MovieMasonry(
        movies: popularMovies,
        loadNextPage: () =>
            ref.read(popularMoviesProvider.notifier).loadNextPage(),
      ),
    );
  }
}
