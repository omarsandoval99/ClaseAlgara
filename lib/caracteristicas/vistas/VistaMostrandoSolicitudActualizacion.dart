import 'package:flutter/material.dart';

import 'package:flutter_application_1/caracteristicas/verificacion/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class VistaMostrandoSolicitudActualizacion extends StatelessWidget {
  const VistaMostrandoSolicitudActualizacion({super.key});

  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Center(
      child: Column(
        children: [
          Text("Actualizate compaye",
              style: Theme.of(context).textTheme.headline1),
          TextButton(
              onPressed: () {
                elbloc.add(Creado());
              },
              child: const Text("REGRESAR"))
        ],
      ),
    );
  }
}
