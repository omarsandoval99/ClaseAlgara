import 'package:flutter_application_1/caracteristicas/data_usuario.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group('obtener coleccion para benthor', (){
    test('benthor tiene juego Aguila Roja', (){
      ChecadorDeJugadasDePrueba checador = ChecadorDeJugadasDePrueba();

      expect(checador.obtenerJuegos(NickFormado.constructor("benthor")).juegos, contains("Aguila Roja"));
    });
  });
}