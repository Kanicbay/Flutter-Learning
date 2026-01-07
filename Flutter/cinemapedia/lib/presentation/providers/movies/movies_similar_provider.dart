import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final moviesRepository = ref.watch(movieRepositoryProvider);
  return moviesRepository.getSimilarMovies(movieId);
  
},);