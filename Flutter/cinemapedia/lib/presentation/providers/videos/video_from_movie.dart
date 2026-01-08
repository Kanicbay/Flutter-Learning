import 'package:cinemapedia/domain/entities/video.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videosFromMovieProvider = FutureProvider.family<List<Video>, int>((
  ref,
  int movieId,
) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getYoutubeVideosById(movieId);
});
