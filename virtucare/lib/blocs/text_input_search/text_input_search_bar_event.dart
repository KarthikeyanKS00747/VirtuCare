part of 'text_input_search_bar_bloc.dart';

@immutable
abstract class TextInputSearchBarEvent {}

class ReloadEvent extends TextInputSearchBarEvent {}

class UpdateTextEvent extends TextInputSearchBarEvent {
  final String text;

  UpdateTextEvent(this.text);
}
