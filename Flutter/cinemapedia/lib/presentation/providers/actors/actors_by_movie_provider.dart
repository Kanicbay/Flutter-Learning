import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    NotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
      ActorsByMovieNotifier.new,
    );

class ActorsByMovieNotifier extends Notifier<Map<String, List<Actor>>> {
  @override
  Map<String, List<Actor>> build() {
    return {};
  }

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await ref
        .watch(actorsRepositoryProvider)
        .getActorsByMovie(movieId);
    state = {...state, movieId: actors};
  }
}
