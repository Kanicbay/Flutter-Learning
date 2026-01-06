import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
      StorageMoviesNotifier.new,
    );

class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
  int page = 0;
  LocalStorageRepository get localStorageRepository =>
      ref.watch(localStorageRepositoryProvider);

  @override
  build() => {};

  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await localStorageRepository.isFavoriteMovie(movie.id);
    print('isFavorite: $isFavorite');
    await localStorageRepository.toggleFavoriteMovie(movie);

    if (isFavorite) {
      state.remove(movie.id);
      state = {...state};
      return;
    }

    state = {...state, movie.id: movie};
  }
}
