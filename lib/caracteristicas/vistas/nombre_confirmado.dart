import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/bloc.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';

class VistaNombreConfirmado extends StatelessWidget {
  const VistaNombreConfirmado({Key? key, required this.registro}) : super(key: key);
  final RegistroUsuario registro;
  
  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Column(
      children: [
        Text('${registro.apellido} ${registro.nombre}'),
        Text('${registro.anioRegistro}'),
        Text('${registro.pais}, ${registro.estado}'),
        TextButton(onPressed: (){
          elbloc.add(Creado());
        }, child: const Text("Volver"))
      ],
    );
  }
}