import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:flutter_application_1/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_application_1/dominio/problema.dart';
import 'package:xml/xml.dart';

abstract class repositorioVerificacion {
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick);
}

List campos = [
  'yearregistered',
  'firstname',
  'stateorprovince',
  'country',
  'lastname'
];

class RepositorioPruebasVerificacion extends repositorioVerificacion {
  final String _benthor = """ <?xml version="1.0" encoding="utf-8"?>
      <user id="597373" name="benthor" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
										<firstname value="Benthor" />	
                    		<lastname value="Benthor" />	
                    		<avatarlink value="N/A" />	
                        		<yearregistered value="2012" />			
                    <lastlogin value="2022-05-31" />	
                    		<stateorprovince value="" />		
                        	<country value="" />		
                          	<webaddress value="" />		
                            	<xboxaccount value="" />	
                              		<wiiaccount value="" />		
                                  	<psnaccount value="" />	
                                    		<battlenetaccount value="" />	
                                        		<steamaccount value="" />		
                                            	<traderating value="0" />	
				</user> """;

  final String _incorrecta = """ <?xml version="1.0" encoding="utf-8"?>
      <user id="597373" name="benthor" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
										<firstsname value="Benthor" />	
                    		<lashgvcfgcame value="Benthor" />	
                    		<avataralink value="N/A" />	
                        		<yearsregistered value="2012" />			
                    <lastlogin vaaalue="2022-05-31" />	
                    		<statfeorpcarovince value="" />		
                        	<coundtry value="" />		
                          	<webadfdress value="" />		
                            	<xboxacccount value="" />	
                              		<wiicaccount value="" />		
                                  	<psnaxccount value="" />	
                                    		<battxlenetaccount value="" />	
                                        		<stecaamaccount value="" />		
                                            	<traderacating value="0" />	
				</user> """;

  final String _amlo =
      """<?xml version="1.0" encoding="utf-8"?><user id="" name="" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
										<firstname value="" />			<lastname value="" />			<avatarlink value="N/A" />			<yearregistered value="" />			<lastlogin value="" />			<stateorprovince value="" />			<country value="" />			<webaddress value="" />			<xboxaccount value="" />			<wiiaccount value="" />			<psnaccount value="" />			<battlenetaccount value="" />			<steamaccount value="" />			<traderating value="362" />	
				</user> """;

  Either<Problema, RegistroUsuario> obtenerRegistroUsuarioDesdeXML(
      XmlDocument documento) {
    const campoAnio = 'yearregistered';
    const campoValor = 'value';
    const campoNombre = 'firstname';
    const campoEstado = 'stateorprovince';
    const campoPais = 'country';
    const campoApellidos = 'lastname';

    if (!_check(documento)) {
      return left(VersionIncorrectaXml());
    }

    final anioRegistrado = obtenerValorCampo(documento, campoAnio);

    if (anioRegistrado.isEmpty) {
      return left(UsuarioNoRegistrado());
    }

    String nombre = obtenerValorCampo(documento, campoNombre);
    String pais = obtenerValorCampo(documento, campoPais);
    String estado = obtenerValorCampo(documento, campoEstado);
    String apellido = obtenerValorCampo(documento, campoApellidos);

    return Right(RegistroUsuario.constructor(
      propuestaAnio: anioRegistrado,
      propuestaNombre: nombre,
      propuestaApellido: apellido,
      propuestaEstado: estado,
      propuestaPais: pais,
    ));
  }

  String obtenerValorCampo(XmlDocument documento, String campo) {
    const campoValor = 'value';

    var x = documento.findAllElements(campo).first.getAttribute(campoValor);

    return documento.findAllElements(campo).first.getAttribute(campoValor) ??
        '';
  }

  @override
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick) {
    if (nick.valor == 'benthor') {
      final documento = XmlDocument.parse(_benthor);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }
    if (nick.valor == 'amlo') {
      final documento = XmlDocument.parse(_amlo);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }
    if (nick.valor == 'incorrecta') {
      final documento = XmlDocument.parse(_incorrecta);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }

    return Left(UsuarioNoRegistrado());
  }
}

bool _check(XmlDocument documento) {
  List<String> lista = [];
  for (var element in documento.childElements) {
    for (var node in element.childElements) {
      lista.add(node.name.toString());
    }
  }
  for (String chequeo in campos) {
    if (!lista.contains(chequeo)) {
      return false;
    }
  }

  return true;
}
