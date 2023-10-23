import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_event.dart';
part 'item_state.dart';
part 'item_bloc.freezed.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc()
      : super(const ItemState(
            items: IListConst([
          "Item 1",
          "Item 2",
          "Item 3",
          "Item 4",
          "Item 5",
          "Item 6"
        ]))) {
    on<ItemEvent>((event, emit) {
      event.when(reorder: (oldIndex, newIndex) {
        final item = state.items[oldIndex];
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        emit(state.copyWith(
            items: state.items.removeAt(oldIndex).insert(newIndex, item)));
      });
    });
  }
}
