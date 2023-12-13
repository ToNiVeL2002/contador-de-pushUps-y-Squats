part of 'contador_sets_bloc.dart';

sealed class ContadorSetsEvent extends Equatable {
  const ContadorSetsEvent();

  @override
  List<Object> get props => [];
}

class MostrarSetsFaltantes extends ContadorSetsEvent{
  final setsFal;
  MostrarSetsFaltantes(this.setsFal);
}


class DecrementoSets extends ContadorSetsEvent{
  // final setsfal;
  // DecrementoSets(this.setsfal);

}