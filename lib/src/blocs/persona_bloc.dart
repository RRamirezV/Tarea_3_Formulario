import 'dart:async';

import '../models/persona.dart';

class PersonaBloc {
  static List<Persona> _personaList = [
    Persona(1, "Juan", "Perez", 19),
    Persona(2, "Martin", "Calle", 23),
    Persona(3, "Luis", "Espinoza", 30),
    Persona(4, "Raul", "Martinez", 21),
  ];
  //Stream Controller
  final _personaListStreamController = StreamController<List<Persona>>();
  var _personaSalarioIncrementStreamController = StreamController<Persona>();
  var _personaSalarioDecrementStreamController = StreamController<Persona>();
  var _personaSalarioAgregarStreamController = StreamController<Persona>();

  //getter: Stream and Sinks
  Stream<List<Persona>> get personaListStream =>
      _personaListStreamController.stream;
  StreamSink<List<Persona>> get personaListSink =>
      _personaListStreamController.sink;
/* 
  StreamSink<Persona> get personaSalarioIncrement =>
      _personaSalarioIncrementStreamController.sink;
  StreamSink<Persona> get personaSalarioDecrement =>
      _personaSalarioDecrementStreamController.sink; */
  StreamSink<Persona> get personaSalarioAgregar =>
      _personaSalarioAgregarStreamController.sink;

  //constructor
  PersonaBloc() {
    _personaListStreamController.add(_personaList);
    //_personaSalarioIncrementStreamController.stream.listen(_incrementSalario);
    //_personaSalarioDecrementStreamController.stream.listen(_decrementSalario); 
    _personaSalarioAgregarStreamController.stream.listen(_AgregarPersona);
  }
  //generar las funciones principales
/*   _incrementSalario(Persona objE) {
    //print(objE.id);
    double salarioActual = objE.salario;
    double SalarioIncrement = salarioActual * 20 / 100;
    double salario = salarioActual + SalarioIncrement;
    _personaList[objE.id - 1].salario =
        double.parse((salario).toStringAsFixed(2));
    personaListSink.add(_personaList);
  }

  _decrementSalario(Persona objE) {
    double salarioActual = objE.salario;
    double SalarioDecrement = salarioActual * 20 / 100;
    double salario = salarioActual - SalarioDecrement;
    _personaList[objE.id - 1].salario =
        double.parse((salario).toStringAsFixed(2));
    personaListSink.add(_personaList);
  } */

  // ignore: non_constant_identifier_names
  _AgregarPersona(Persona objP) {
    objP.id = _personaList.length + 1;
    _personaList.add(objP);
    //print(_personaList.length);
    _personaListStreamController.add(_personaList);
  }

  void dispose() {
    _personaListStreamController.close();

    _personaSalarioDecrementStreamController.close();
    _personaSalarioIncrementStreamController.close();
    _personaSalarioAgregarStreamController.close();
  }
}
