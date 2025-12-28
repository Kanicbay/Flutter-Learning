import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  MoviesNotifier.new,
);

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;

  MovieCallBack get fetchMoreMovies =>
      ref.watch(movieRepositoryProvider).getNowPlaying;

  @override
  List<Movie> build() => [];

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
