part of 'angulo_bar_bloc.dart';

sealed class AnguloBarState extends Equatable {
  double anguloVer=30.0;

  AnguloBarState();
  
  @override
  List<Object> get props => [];
}

final class AnguloBarInitial extends AnguloBarState {}

class Angulo extends AnguloBarState{
  double anguloVer;

  Angulo(this.anguloVer);

  @override
  List<Object> get props => [anguloVer];
}