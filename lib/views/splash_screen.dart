import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:push_up_counter/models/bloc/angulo_bar_bloc.dart';
import 'package:push_up_counter/models/bloc/bloc/contador_sets_bloc.dart';
import 'package:push_up_counter/models/bloc/bloc/llenar_datos_bloc.dart';
import 'package:push_up_counter/views/pose_detection_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff273338),
        minimumSize: Size(size.width * 0.85, 50),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))));

    return BlocBuilder<LlenarDatosBloc, LlenarDatosState>(
      builder: (context, state) {
        final contadorsetsBloc = BlocProvider.of<ContadorSetsBloc>(context);
        return Scaffold(
            backgroundColor: Color(0xfff5f5f5),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),

                    const Text(
                      'Gym Trainer',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.2,
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      width: size.width * 0.7,
                      height: size.width * 0.7,
                      child: Lottie.asset('assets/push-up-animation.json',
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: const Text(
                        'Un compañero para tu rutina de ejercicio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: -1.2,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      child: Column(
                        children: [
                          Text('Tu IMC es: ${state.imc}'),
                          Text('Tu PESO es: ${state.peso} kg'),
                          Text('Tu ALTURA es: ${state.altura} cm'),
                          Text('Tu ESTADO es: ${state.estado}'),
                          Text('Tu sexo es: ${state.sex}'),
                          Text('Tu objetivo es: ${state.obj}'),
                          Text('Tu entrenamiento sera'),
                          Text('Push-Ups: sets: ${state.setsP} - repeticiones: ${state.repP}'),
                          Text('Squats: sets: ${state.setsS} - repeticiones: ${state.repS}'),
                          Text('Entregada set debes descansar: ${state.segundosDescanso}segundos')
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PoseDetectorView(
                                      bandera: true,
                                    )),
                          );
                          contadorsetsBloc.add(MostrarSetsFaltantes(state.setsP));
                        },
                        child: const Text(
                          'Inicar Push-Ups!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PoseDetectorView(
                                      bandera: false,
                                    )),
                          );
                          contadorsetsBloc.add(MostrarSetsFaltantes(state.setsS));
                        },
                        child: const Text(
                          'Inicar Squats!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            )
          );
      },
    );
  } //by samu
}
