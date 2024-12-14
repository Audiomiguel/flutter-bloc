import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    on<SetInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.invited));
    });

    on<SetNoInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.noInvited));
    });

    on<SetAllFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestFilter.all));
    });

    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }
}
