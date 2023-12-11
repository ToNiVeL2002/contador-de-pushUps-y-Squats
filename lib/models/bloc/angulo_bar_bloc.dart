import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'angulo_bar_event.dart';
part 'angulo_bar_state.dart';

class AnguloBarBloc extends Bloc<AnguloBarEvent, AnguloBarState> {
  double angulo = 0.0;

  AnguloBarBloc() : super(AnguloBarInitial()) {
    on<AnguloBarEvent>((event, emit) {
    });

    on<MostrarAngulo>((event, emit) {
      angulo = event.anguloVer;

      if(angulo>0){
        emit(Angulo(angulo));
      }

    },);
  }
}
