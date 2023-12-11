part of 'angulo_bar_bloc.dart';

sealed class AnguloBarEvent extends Equatable {
  const AnguloBarEvent();

  @override
  List<Object> get props => [];
}

class MostrarAngulo extends AnguloBarEvent{
  final double anguloVer;
  MostrarAngulo(this.anguloVer);
}