import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_1/caracteristicas/repositorio_verificacion.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/bloc.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<BlocVerificacion, EstadoVerificacion>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoNombre>()],
  );
  blocTest<BlocVerificacion, EstadoVerificacion>(
    'Cuando nombreRecibido es benthor debe mostrarnombreConfirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    seed: () => SolicitandoNombre(),
    act: (bloc) => bloc.add(NombreRecibido(NickFormado.constructor('benthor'))),
    expect: () =>
        [isA<EsperandoConfirmarNombre>(), isA<MostrandoNombreConfirmado>()],
  );
  blocTest<BlocVerificacion, EstadoVerificacion>(
    'Cuando nombreRecibido es amlo debe mostrarnombrenoConfirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    seed: () => SolicitandoNombre(),
    act: (bloc) => bloc.add(NombreRecibido(NickFormado.constructor('amlo'))),
    expect: () =>
        [isA<EsperandoConfirmarNombre>(), isA<MonstrandoNombreNoConfirmado>()],
  );
  blocTest<BlocVerificacion, EstadoVerificacion>(
    'Cuando nombreRecibido es incorrecto debe MostrandoSolicitudActualizacion',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    seed: () => SolicitandoNombre(),
    act: (bloc) =>
        bloc.add(NombreRecibido(NickFormado.constructor('incorrecta'))),
    expect: () => [
      isA<EsperandoConfirmarNombre>(),
      isA<MostrandoSolicitudActualizacion>()
    ],
  );
}
