part of 'text_input_search_bar_bloc.dart';

@immutable
sealed class TextInputSearchBarState {}

final class TextInputSearchBarInitial extends TextInputSearchBarState {}
final class TextInputSearchBarReloaded extends TextInputSearchBarState {}
final class TextInputSearchBarUpdatedState extends TextInputSearchBarState {
  final String text;

  TextInputSearchBarUpdatedState({required this.text});
}

