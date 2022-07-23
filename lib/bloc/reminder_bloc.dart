import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reminder_app_new/services/network_service.dart';

import '../model/reminder_model.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final ReminderService _reminderService;

  ReminderBloc(this._reminderService) : super(ReminderLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final activity = await _reminderService.getReminder();
      emit(ReminderLoadedState(activity.status.toString(), activity.message,
          activity.data));
    });
  }
}
