import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'angulo_bar_event.dart';
part 'angulo_bar_state.dart';

class AnguloBarBloc extends Bloc<AnguloBarEvent, AnguloBarState> {
  double angulo = 0.0;

  // double imc = 0;
  // double peso = 0.0;
  // int altura = 0;

  // int repP=0;
  // int repS=0;

  // int setsP=0;
  // int setsS=0;

  // int segundosDescanso=0;

  // String sexo=''; 
  // String obj=''; 
  // String estado='';

  AnguloBarBloc() : super(AnguloBarInitial()) {
    on<AnguloBarEvent>((event, emit) {
    });

    on<MostrarAngulo>((event, emit) {
      angulo = event.anguloVer;

      if(angulo>0){
        emit(Angulo(angulo));
      }
    },);

    // on<MostrarSyO>((event, emit) {
    //   if (event.sexoVer != null) {
    //     sexo = event.sexoVer;
    //   }

    //   if (event.objVer != null) {
    //     obj = event.objVer;
    //   }

    //   emit(DatosSyO(sexo, obj));
    // },);

    // on<MostrarDatosG>((event, emit) {
    //   peso = event.peso;
    //   altura = event.altura;

    //   if (obj == 'Bajar de peso') {
    //     if (sexo == 'Masculino') {
    //       imc = peso/((altura*altura)/10000);

    //       if (imc<18.5) {
    //         estado = 'Bajo';
    //         setsP = 4;
    //         repP = 15;
    //         setsS = 4;
    //         repS = 15;
    //       }else if(imc<=18.5 && imc<24.9){
    //         estado = 'Normal';
    //         setsP = 4;
    //         repP = 10;
    //         setsS = 4;
    //         repS = 12;
    //       }else if(imc<=25 && imc<29.9){
    //         estado = 'Sobre peso';
    //         setsP = 4;
    //         repP = 8;
    //         setsS = 4;
    //         repS = 10;
    //       }
    //     }else if(sexo == 'Femenino'){
    //       imc = peso/((altura*altura)/10000);

    //       if (imc<18.5) {
    //         estado = 'Bajo';
    //         setsP = 4;
    //         repP = 15;
    //         setsS = 4;
    //         repS = 15;
    //       }else if(imc<=18.5 && imc<24.9){
    //         estado = 'Normal';
    //         setsP = 4;
    //         repP = 10;
    //         setsS = 4;
    //         repS = 12;
    //       }else if(imc<=25 && imc<29.9){
    //         estado = 'Sobre peso';
    //         setsP = 4;
    //         repP = 8;
    //         setsS = 4;
    //         repS = 10;
    //       }
    //     }

    //   }else if(obj == 'Subir de peso') {
    //     if (sexo == 'Masculino') {
    //       imc = peso/((altura*altura)/10000);
    //       if (imc<18.5) {
    //         estado = 'Bajo';
    //         setsP = 3;
    //         repP = 10;
    //         setsS = 3;
    //         repS = 12;
    //       }else if(imc<=18.5 && imc<24.9){
    //         estado = 'Normal';
    //         setsP = 3;
    //         repP = 10;
    //         setsS = 3;
    //         repS = 12;
    //       }else if(imc<=25 && imc<29.9){
    //         estado = 'Sobre peso';
    //         setsP = 3;
    //         repP = 8;
    //         setsS = 3;
    //         repS = 8;
    //       }
    //     }else if(sexo == 'Femenino'){
    //       imc = peso/((altura*altura)/10000);

    //       if (imc<18.5) {
    //         estado = 'Bajo';
    //         setsP = 3;
    //         repP = 10;
    //         setsS = 3;
    //         repS = 12;
    //       }else if(imc<=18.5 && imc<24.9){
    //         estado = 'Normal';
    //         setsP = 3;
    //         repP = 10;
    //         setsS = 3;
    //         repS = 12;
    //       }else if(imc<=25 && imc<29.9){
    //         estado = 'Sobre peso';
    //         setsP = 3;
    //         repP = 8;
    //         setsS = 3;
    //         repS = 8;
    //       }
    //     }

    //   }
    //   imc = double.parse(imc.toStringAsFixed(2));

    //   // para mandar los datos
    //   print('${repP}, ${repS}, ${setsP}, ${setsS}, ${segundosDescanso}, ${sexo}, ${imc}, ${obj} , ${estado}, ${peso}, ${altura}');
    //   if(imc>0){
    //     emit(DatosG(repP, repS, setsP, setsS, segundosDescanso, imc, estado, peso, altura, sexo, obj));
    //     print('sip');
    //   }

    // },);

  }
}
