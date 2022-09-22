import 'package:flutter/material.dart';
import 'package:flutter_application_1/caracteristicas/repositorio_verificacion.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/bloc.dart';
import 'package:flutter_application_1/caracteristicas/vistas/VistaMostrandoSolicitudActualizacion.dart';
import 'package:flutter_application_1/caracteristicas/vistas/vista_creandose.dart';
import 'package:flutter_application_1/caracteristicas/vistas/vista_esperando_nombre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion =
            BlocVerificacion(RepositorioPruebasVerificacion());
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;

          if (estado is Creandose) {
            return Center(child: const VistaCreandose());
          }

          if (estado is SolicitandoNombre) {
            return VistaSolicitandoNombre();
          }

          if (estado is MostrandoSolicitudActualizacion) {
            return const VistaMostrandoSolicitudActualizacion();
          }

          return Center(
              child: Text('Si estas viendo esto algo salió mal, huye'));
        }),
      ),
    );
  }
}
