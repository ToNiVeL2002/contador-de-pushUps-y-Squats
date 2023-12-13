part of 'llenar_datos_bloc.dart';

sealed class LlenarDatosEvent extends Equatable {
  const LlenarDatosEvent();

  @override
  List<Object> get props => [];
}


class MostrarSyO extends LlenarDatosEvent{
  final String sexoVer, objVer;
  MostrarSyO(this.sexoVer, this.objVer);
}

class MostrarDatosG extends LlenarDatosEvent{
  final double peso; 
  final int altura;

  MostrarDatosG(this.peso, this.altura);
}