import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Movie type
enum MovieType { nowPlaying, popular, uncoming, topRated }

extension _FetchByType on MoviesRepository {
  Future<List<Movie>> fetchByType(MovieType type, {required int page}) {
    switch (type) {
      case MovieType.nowPlaying:
        return getNowPlaying(page: page);
      case MovieType.popular:
        return getPopular(page: page);
      case MovieType.uncoming:
        // TODO: Handle this case.
        throw UnimplementedError();
      case MovieType.topRated:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(type: MovieType.nowPlaying),
);

final popularMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  () => MoviesNotifier(type: MovieType.popular),
);

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  final MovieType type;

  MoviesNotifier({required this.type});

  @override
  List<Movie> build() => [];

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    print('loading more movies');
    currentPage++;
    final List<Movie> movies = await ref
        .read(movieRepositoryProvider)
        .fetchByType(type, page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
