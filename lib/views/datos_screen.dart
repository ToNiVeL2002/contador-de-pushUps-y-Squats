import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:push_up_counter/models/bloc/angulo_bar_bloc.dart';
import 'package:push_up_counter/models/bloc/bloc/llenar_datos_bloc.dart';
import 'package:push_up_counter/views/splash_screen.dart';

class DatosScreen extends StatelessWidget {
  DatosScreen({Key? key}) : super(key: key);

  TextEditingController tfAltura = TextEditingController();
  TextEditingController tfPeso = TextEditingController();
  String sexo='Femenino', objetivo='Bajar de peso';

  final _formKey = GlobalKey<FormState>();

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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Llena tus datos',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Text('Antes de empezar necesito tus datos', style: TextStyle(fontSize: 20),),
                    ),

                    SizedBox(height: 20,),

                    Center(
                      child: DropdownButton(
                        underline: Container(),
                        value: state.sex,
                        items: <String>['Masculino', 'Femenino']
                            .map((String valorS) {
                          return DropdownMenuItem<String>(
                            value: valorS,
                            child: Center(child: Text(valorS))
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          context.read<LlenarDatosBloc>().add(
                            MostrarSyO(newValue ?? 'Femenino', objetivo)
                          );
                          sexo = newValue ?? 'Femenino';
                          print(newValue);
                        },
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: tfAltura,
                      decoration: InputDecoration(
                          labelText: 'Altura',
                          hintText: 'Ingresa tu altura en cm',
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: tfPeso,
                      decoration: InputDecoration(
                          labelText: 'Peso',
                          hintText: 'Ingresa tu peso en kg',
                          prefixIcon: Icon(Icons.monitor_weight),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: DropdownButton(
                        underline: Container(),
                        value: state.obj,
                        items: <String>[
                          'Bajar de peso',
                          'Subir de peso',
                          'Que se arrepienta'
                        ].map((String valorO) {
                          return DropdownMenuItem<String>(
                            value: valorO,
                            child: Center(child: Text(valorO)),
                          );
                        }).toList(),
                        onChanged: (String? nuevoValue) {
                          context.read<LlenarDatosBloc>().add(
                            MostrarSyO(sexo, nuevoValue ?? 'Subir de peso')
                          );
                          objetivo = nuevoValue ?? 'Bajar de peso';
                          print('--${nuevoValue}');
                        },
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SplashScreen()),
                          );

                          print('${sexo} -- ${objetivo} -- ${tfPeso} -- ${tfAltura}');
                          
                          context.read<LlenarDatosBloc>().add(
                            MostrarDatosG(double.parse(tfPeso.text), (double.parse(tfAltura.text)).toInt() )
                          );
                        }
                      },
                      child: const Text(
                        'VAMOS',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
