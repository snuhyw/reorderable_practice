part of 'item_bloc.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState({
    required IList items,
  }) = _ItemState;
}
