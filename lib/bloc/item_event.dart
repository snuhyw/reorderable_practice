part of 'item_bloc.dart';

@freezed
class ItemEvent with _$ItemEvent {
  const factory ItemEvent.reorder(int oldIndex, int newIndex) = _Reorder;
}
