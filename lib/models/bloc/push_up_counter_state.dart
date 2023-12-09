import 'package:equatable/equatable.dart';

enum PushUpState {
  neutral,
  init,
  complete,
}

abstract class PushUpCounterState extends Equatable {
  final int counter;
  final PushUpState pushUpState;

  const PushUpCounterState(this.counter, this.pushUpState);

  @override
  List<Object?> get props => [counter, pushUpState];
}

class InitialPushUpCounterState extends PushUpCounterState {
  const InitialPushUpCounterState(int counter, PushUpState pushUpState)
      : super(counter, pushUpState);
}
