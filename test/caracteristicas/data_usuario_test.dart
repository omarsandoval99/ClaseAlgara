import 'package:flutter_application_1/caracteristicas/data_usuario.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group('pruebas para buscar jugadas', (){
    test('obtener coleccion para benthor', (){
      ChecadorDeJugadasDePrueba checador = ChecadorDeJugadasDePrueba();

      expect(checador.obtenerJuegos(NickFormado.constructor("benthor")).juegos, contains("Aguila Roja"));
    });
  });
}