part of 'angulo_bar_bloc.dart';

sealed class AnguloBarState extends Equatable {
  double anguloVer=100.0;
  // double imc = 0;
  // double peso = 0.0;
  // int altura = 0;
  
  // int repP=0;
  // int repS=0;

  // int setsP=0;
  // int setsS=0;

  // int segundosDescanso=0;

  // String sex='Femenino'; 
  // String obj='Bajar de peso'; 
  // String estado='';

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

// final class DatosSyO extends AnguloBarState{
//   String sex, obj;

//   DatosSyO(this.sex, this.obj);

//   @override
//   List<Object> get props => [sex, obj];
// }

// final class DatosG extends AnguloBarState{
//   double imc, peso;
//   int altura;

//   int repP, repS;

//   int setsP, setsS;

//   int segundosDescanso;

//   String estado, sex, obj;

//   DatosG(this.repP, this.repS, this.setsP, this.setsS, this.segundosDescanso, this.imc, this.estado, this.peso, this.altura, this.sex, this.obj);
  
//   @override
//   List<Object> get props => [imc, peso, altura, repP, repS, setsP, setsS, segundosDescanso, estado, sex, obj];
// }


