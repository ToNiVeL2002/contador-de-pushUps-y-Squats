import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/models/bloc/angulo_bar_bloc.dart';
import 'package:push_up_counter/models/bloc/bloc/llenar_datos_bloc.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_bloc.dart';
import 'package:push_up_counter/views/datos_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => PushUpCounterBloc(),

      providers: [
        BlocProvider<PushUpCounterBloc>(create: (context) => PushUpCounterBloc()),
        BlocProvider<AnguloBarBloc>(create: (context) => AnguloBarBloc()),
        BlocProvider<LlenarDatosBloc>(create: (context) => LlenarDatosBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: DatosScreen()
      ),
    );
  }
}


