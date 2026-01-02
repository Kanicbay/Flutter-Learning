import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

final movieInfoProvider = NotifierProvider(MovieMapNotifier.new);

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await ref
        .watch(movieRepositoryProvider)
        .getMovieById(movieId);
    state = {...state, movieId: movie};
  }
}
