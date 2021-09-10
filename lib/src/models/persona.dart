import 'package:flutter/material.dart';

class Persona {
  int _id = 0;
  String _nombre = "";
  String _apellido = "";
  int _edad = 0;
  Persona(this._id, this._nombre, this._apellido, this._edad);

  //getter
  int get id => _id;
  String get nombre => _nombre;
  String get apellido => _apellido;
  int get edad => _edad;
  //setter
  set id(int v) {
    _id = v;
  }

  set nombre(String v) {
    _nombre = v;
  }

  set apellido(String v) {
    _apellido = v;
  }

  set edad(int v) {
    _edad = v;
  }
}
