import 'package:flutter/material.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/bloc.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaSolicitandoNombre extends StatefulWidget {
  const VistaSolicitandoNombre({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoNombre> createState() => _VistaSolicitandoNombreState();
}

class _VistaSolicitandoNombreState extends State<VistaSolicitandoNombre> {
  final controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Column(
      children: [
        const Text('Dame el nombre'),
        TextField(
          controller: controlador,
        ),
        TextButton(
            onPressed: () {
              elbloc.add(
                  NombreRecibido(NickFormado.constructor(controlador.text)));
            },
            child: const Text('Algo debe decir aqui')),
      ],
    );
  }
}
