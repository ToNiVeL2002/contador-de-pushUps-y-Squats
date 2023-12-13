part of 'llenar_datos_bloc.dart';

sealed class LlenarDatosState extends Equatable {

  double imc = 0;
  double peso = 0.0;
  int altura = 0;
  
  int repP=0;
  int repS=0;

  int setsP=0;
  int setsS=0;

  int segundosDescanso=0;

  String sex='Femenino'; 
  String obj='Bajar de peso'; 
  String estado='';

  LlenarDatosState();
  
  @override
  List<Object> get props => [];
}

final class LlenarDatosInitial extends LlenarDatosState {}

final class DatosSyO extends LlenarDatosState{
  String sex, obj;

  DatosSyO(this.sex, this.obj);

  @override
  List<Object> get props => [sex, obj];
}

final class DatosG extends LlenarDatosState{
  double imc, peso;
  int altura;

  int repP, repS;

  int setsP, setsS;

  int segundosDescanso;

  String estado, sex, obj;

  DatosG(this.repP, this.repS, this.setsP, this.setsS, this.segundosDescanso, this.imc, this.estado, this.peso, this.altura, this.sex, this.obj);
  
  @override
  List<Object> get props => [imc, peso, altura, repP, repS, setsP, setsS, segundosDescanso, estado, sex, obj];
}


