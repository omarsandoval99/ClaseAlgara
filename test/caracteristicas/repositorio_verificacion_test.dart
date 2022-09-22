import 'package:flutter_application_1/caracteristicas/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/problema.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:core';

void main() {
  group('Pruebas verificación offline', () {
    test('Con benthor me regresa valor', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('benthor'));
      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.anioRegistro, equals(2012));
        expect(r.nombre, equals('Benthor'));
        expect(r.apellido, equals('Benthor'));
        expect(r.estado, equals(mensajeCampoVacio));
        expect(r.pais, equals(mensajeCampoVacio));
      });
    });

    test('Con amlo no regresa error', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('amlo'));
      resultado.match((l) {
        expect(true, equals(true));
      }, (r) {
        expect(true, equals(false));
      });
    });

    test('Con xml incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('incorrecta'));
      resultado.match((l) {
        expect(l, isA<VersionIncorrectaXml>());
      }, (r) {
        assert(false);
      });
    });
  });
}
