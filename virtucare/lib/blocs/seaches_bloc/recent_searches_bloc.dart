import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recent_searches_event.dart';
part 'recent_searches_state.dart';

class RecentSearchesBloc extends Bloc<RecentSearchesEvent, RecentSearchesState> {
    List<String> words = [
      "yellow med",
      "yellow med",
      "yellow med",
      "yellow med"
    ];
  RecentSearchesBloc() : super(RecentSearchesInitial()) {
    on<RecentSearchesEvent>((event, emit) {
      List<String> searchedTitles = [];
      for (var element in words)
      {
        if (element.contains(event.word))
        {
          searchedTitles.add(element);
        }
      }
      emit(RecentSearchesLoaded(words: searchedTitles));
    });
  }
}
