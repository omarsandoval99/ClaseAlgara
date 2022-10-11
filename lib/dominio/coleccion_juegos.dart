import 'package:xml/xml.dart';

class ColeccionJuegos{
  late final List<String> juegos;
  late final List<int> fechaDeSalidaJuego;
  
  ColeccionJuegos._(this.juegos, this.fechaDeSalidaJuego);

  factory ColeccionJuegos.constructor({required propuestaJuegos, required propuestaFechas}){
    return ColeccionJuegos._(propuestaJuegos, propuestaFechas);
  }

  obtenerJuegosPorPaginaDesdeXML(XmlDocument document){

  }

  obtenerJuegosTodasLasPaginas(String nick){
    
    /*
      List<String> juegos
      int paginas =  obtenertotalpaginas (nick);
      for (x=1;paginas;x++;){
        var jugadasPagina = fetch https://boardgamegeek.com/xmlapi2/plays?username=benthor&page=$x
        var coleccionporPagina = obtenerJuegosPorPaginaDesdeXML(jugadasPagina)
        juegos.add()
      }
     */
  }
  int obtenerTotalPaginas(String nick){
    /*
      fetch https://boardgamegeek.com/xmlapi2/plays?username=$nick
      int totalJugadas = document getelements "plays" first get attribute total .ceil
      int pags = (totalJugadas / 10) .ceil
      return pags
     */
    return 0;
  }
}