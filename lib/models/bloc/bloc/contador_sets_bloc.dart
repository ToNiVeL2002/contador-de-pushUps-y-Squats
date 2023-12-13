import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contador_sets_event.dart';
part 'contador_sets_state.dart';

class ContadorSetsBloc extends Bloc<ContadorSetsEvent, ContadorSetsState> {
  int sf=0;

  ContadorSetsBloc() : super(ContadorSetsInitial()) {
    on<ContadorSetsEvent>((event, emit) {
    });

    on<MostrarSetsFaltantes>((event, emit) {
      sf = event.setsFal;
      emit(SetsFaltantes(sf));
    },);

    on<DecrementoSets>((event, emit) {
      sf--;
      print('-------${sf}');
      emit(SetsFaltantes(sf));
    },);
  }
}
