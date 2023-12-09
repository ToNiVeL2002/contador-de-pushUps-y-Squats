import 'package:bloc/bloc.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_event.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_state.dart';

class PushUpCounterBloc extends Bloc<PushUpEvent, PushUpCounterState> {
  PushUpCounterBloc() : super(InitialPushUpCounterState(0, PushUpState.neutral)){
    on<IncrementPushUpEvent>(_handleIncrementEvent);
    on<ResetPushUpEvent>(_handleResetEvent);
    on<SetPushUpStateEvent>(_handleSetStateEvent);
  }

  void _handleIncrementEvent(IncrementPushUpEvent event, Emitter<PushUpCounterState> emit) {
    if(state.pushUpState == PushUpState.init){
      emit(InitialPushUpCounterState(state.counter + 1, state.pushUpState));
    }
  }

  void _handleResetEvent(ResetPushUpEvent event, Emitter<PushUpCounterState> emit) {
    emit(InitialPushUpCounterState(0, PushUpState.neutral));
  }

  void _handleSetStateEvent(SetPushUpStateEvent event, Emitter<PushUpCounterState> emit) {
    emit(InitialPushUpCounterState(state.counter, event.newState));
  }

  @override
  Stream<PushUpCounterState> mapEventToState(PushUpEvent event) async* {
    if (event is IncrementPushUpEvent) {
      yield InitialPushUpCounterState(state.counter + 1, state.pushUpState);
    } else if (event is ResetPushUpEvent) {
      yield InitialPushUpCounterState(0, PushUpState.neutral);
    } else if (event is SetPushUpStateEvent) {
      yield InitialPushUpCounterState(state.counter, event.newState);
    }
  }
}
