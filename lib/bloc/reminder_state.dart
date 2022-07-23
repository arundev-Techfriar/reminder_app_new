part of 'reminder_bloc.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();
}

class ReminderLoadingState extends ReminderState {
  @override
  List<Object> get props => [];
}

class ReminderLoadedState extends ReminderState {
  final String reminderMessage;
  final String date;
  final String time;

  ReminderLoadedState(this.reminderMessage, this.date, this.time);

  @override
  List<Object?> get props => [reminderMessage, date, time];
}
