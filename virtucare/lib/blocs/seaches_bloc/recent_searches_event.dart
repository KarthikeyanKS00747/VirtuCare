part of 'recent_searches_bloc.dart';

@immutable
sealed class RecentSearchesEvent {
  final String word;

  RecentSearchesEvent({required this.word});

}
