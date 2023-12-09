import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_bloc.dart';
import 'package:push_up_counter/models/push_up_model.dart';
import 'package:push_up_counter/views/splash_screen.dart';

import 'views/pose_detection_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PushUpCounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: SplashScreen()
      ),
    );
  }
}


