import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuest>(_addGuestHandler);
    on<ToggleGuest>(_addToggleGuestHandler);
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String name) {
    add(AddGuest(name));
  }

  void toggleGuest(String id) {
    add(ToggleGuest(id));
  }

  void _addGuestHandler(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _addToggleGuestHandler(ToggleGuest event, Emitter<GuestsState> emit) {
    final newGuest = state.guests.firstWhere((guest) => guest.id == event.id);
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return newGuest.copyWith(
            completedAt: newGuest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }
}
