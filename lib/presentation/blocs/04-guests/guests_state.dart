part of 'guests_bloc.dart';

enum GuestFilter { all, invited, noInvited }

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  int get guestsQuantity => guests.length;

  int get filteredGuestsQuantity => currentGuests.length;

  List<Todo> get currentGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
      case GuestFilter.all:
        return guests;
      default:
        return [];
    }
  }

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );

  @override
  List<Object> get props => [
        filter,
        guests,
      ];
}
