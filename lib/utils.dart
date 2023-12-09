import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:push_up_counter/models/bloc/push_up_counter_state.dart';
import 'package:push_up_counter/models/push_up_model.dart';

Future<String> getAssetPath(String asset) async {
  final path = await getLocalPath(asset);
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}



// METODO PARA CALCULAR EL ANGULO
double angle(
      PoseLandmark firstLandmark,
      PoseLandmark midLandmark,
      PoseLandmark lastLandmark 
  ) {
      final radians =
          math.atan2(lastLandmark.y - midLandmark.y,
                    lastLandmark.x - midLandmark.x) -
            math.atan2(firstLandmark.y - midLandmark.y,
                    firstLandmark.x - midLandmark.x);
      double degrees = radians * 180.0 / math.pi;
      degrees = degrees.abs();
      if (degrees > 180.0) {
          degrees = 360.0 - degrees;
      }
      return degrees;
  }

  PushUpState? isPushUp(double angleElbow, PushUpState current) {
    final umbralElbow = 60.0;
    final umbralElbowExt = 160.0;

    print('isPushUp - current: $current, angleElbow: $angleElbow');

    if (current == PushUpState.neutral && angleElbow > umbralElbowExt && angleElbow < 180.0) {
      print('isPushUp - Returning: PushUpState.init');
      return PushUpState.init;
    } else if (current == PushUpState.init && angleElbow < umbralElbow && angleElbow > 40.0) {
      print('isPushUp - Returning: PushUpState.complete');
      return PushUpState.complete;
    }

    print('isPushUp - Returning: null');

    return null;
  }


