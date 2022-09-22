import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/caracteristicas/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/problema.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';

class EventoVerificacion {}

class Creado extends EventoVerificacion {}

class NombreRecibido extends EventoVerificacion {
  final NickFormado nick;
  NombreRecibido(this.nick);
}

class NombreConfirmado extends EventoVerificacion {}

class NombreNoConfirmado extends EventoVerificacion {}

class EstadoVerificacion {}

class Creandose extends EstadoVerificacion {}

class SolicitandoNombre extends EstadoVerificacion {}

class EsperandoConfirmarNombre extends EstadoVerificacion {}

class MostrandoSolicitudActualizacion extends EstadoVerificacion {}

class MostrandoNombreConfirmado extends EstadoVerificacion {
  final RegistroUsuario registroUsuario;
  MostrandoNombreConfirmado(this.registroUsuario);
}

class MonstrandoNombreNoConfirmado extends EstadoVerificacion {
  final NickFormado nick;
  MonstrandoNombreNoConfirmado(this.nick);
}

class BlocVerificacion extends Bloc<EventoVerificacion, EstadoVerificacion> {
  final repositorioVerificacion _repositorioVerificacion;

  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombre());
    });
    on<NombreRecibido>((event, emit) {
      emit(EsperandoConfirmarNombre());
      final resultado =
          _repositorioVerificacion.obtenerRegistroUsuario(event.nick);
      resultado.match((l) {
        l is VersionIncorrectaXml
            ? emit(MostrandoSolicitudActualizacion())
            : null;

        l is UsuarioNoRegistrado
            ? emit(MonstrandoNombreNoConfirmado(event.nick))
            : null;
      }, (r) {
        emit(MostrandoNombreConfirmado(r));
      });
    });
  }
}
