part of 'contador_sets_bloc.dart';

sealed class ContadorSetsState extends Equatable {
  int setsFaltantes = 0;

  ContadorSetsState();
  
  @override
  List<Object> get props => [];
}

final class ContadorSetsInitial extends ContadorSetsState {}

final class SetsFaltantes extends ContadorSetsState{
  int setsFaltantes;

  SetsFaltantes(this.setsFaltantes);

  @override
  List<Object> get props => [setsFaltantes];
}

final class SetsDecrementados extends ContadorSetsState{
  int setsF;

  SetsDecrementados(this.setsF);

  @override
  List<Object> get props => [setsF];
}