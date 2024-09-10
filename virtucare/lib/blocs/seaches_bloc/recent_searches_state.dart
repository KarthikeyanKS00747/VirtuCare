part of 'recent_searches_bloc.dart';

@immutable
sealed class RecentSearchesState {}

final class RecentSearchesInitial extends RecentSearchesState {}
final class RecentSearchesLoading extends RecentSearchesState {}
final class RecentSearchesLoaded extends RecentSearchesState {
  final List<String> words;

  RecentSearchesLoaded({required this.words});
}

