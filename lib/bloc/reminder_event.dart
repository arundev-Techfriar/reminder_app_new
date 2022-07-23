part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();
}

class LoadApiEvent extends ReminderEvent {
  @override
  List<Object?> get props => [];
}
