import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_input_search_bar_event.dart';
part 'text_input_search_bar_state.dart';

class TextInputSearchBarBloc extends Bloc<TextInputSearchBarEvent, TextInputSearchBarState> {
  TextInputSearchBarBloc() : super(TextInputSearchBarInitial()) {
    Stream<TextInputSearchBarState> mapEventToState(TextInputSearchBarEvent event) async* {
    if (event is ReloadEvent) {
      yield TextInputSearchBarReloaded();
    } else if (event is UpdateTextEvent) {
      yield TextInputSearchBarUpdatedState(text: event.text);
    }
  }
  }
}
