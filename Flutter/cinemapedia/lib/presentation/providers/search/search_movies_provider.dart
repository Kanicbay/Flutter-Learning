import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = NotifierProvider<SearchNotifier, String>(
  SearchNotifier.new,
);

class SearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(query) {
    state = query;
  }
}

final searchedMoviesProvider =
    NotifierProvider<SearchedMoviesNotifier, List<Movie>>(
      SearchedMoviesNotifier.new,
    );

class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  @override 
  List<Movie> build() => [];

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await ref
        .read(movieRepositoryProvider)
        .searchMovies(query);
    ref.read(searchQueryProvider.notifier).update(query);
    state = movies;
    return movies;
  }
}
