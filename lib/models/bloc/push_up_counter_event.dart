import 'package:equatable/equatable.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_state.dart';

abstract class PushUpEvent extends Equatable {
  const PushUpEvent();
}

class IncrementPushUpEvent extends PushUpEvent {
  @override
  List<Object?> get props => [];
}

class ResetPushUpEvent extends PushUpEvent {
  @override
  List<Object?> get props => [];
}

class SetPushUpStateEvent extends PushUpEvent {
  final PushUpState newState;

  SetPushUpStateEvent(this.newState);

  @override
  List<Object?> get props => [newState];
}