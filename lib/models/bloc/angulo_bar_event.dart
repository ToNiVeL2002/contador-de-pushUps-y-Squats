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

// class MostrarSyO extends AnguloBarEvent{
//   final String sexoVer, objVer;
//   MostrarSyO(this.sexoVer, this.objVer);
// }

// class MostrarDatosG extends AnguloBarEvent{
//   final double peso; 
//   final int altura;

//   MostrarDatosG(this.peso, this.altura);
// }
