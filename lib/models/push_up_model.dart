import 'package:flutter_bloc/flutter_bloc.dart';

// enumerador para ver los 3 estados posibles de las flexiones
enum PushUpState{
  neutral,
  init,
  complete
}


// para manejar el ESTADO
// el estado inicial es neutral
class PushUpCounter extends Cubit<PushUpState>{
  PushUpCounter() : super(PushUpState.neutral);
  int counter = 0;

  void setPushUpState(PushUpState current){
    emit(current);
  }

  void increment(){
    counter++;
    emit(state);
  }

  void reset(){
    counter = 0;
    emit(state);
  }

}


