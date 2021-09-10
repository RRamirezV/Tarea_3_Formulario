import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tarea3/src/blocs/persona_bloc.dart';
import 'package:tarea3/src/models/persona.dart';
import 'package:tarea3/src/ui/persona_page.dart';

class MyPersonaPageCreate extends StatefulWidget {
  const MyPersonaPageCreate({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyPersonaPageCreateState createState() => _MyPersonaPageCreateState();
}

class _MyPersonaPageCreateState extends State<MyPersonaPageCreate> {
  final _formKey = GlobalKey<FormState>();
  Persona objPersona = Persona(0, "", "", 0);
  PersonaBloc _personaBloc = PersonaBloc();
  final _txtNombre = TextEditingController();
  final _txtApellido = TextEditingController();
  final _txtEdad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      backgroundColor: Colors.green,
      ),
      body: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                children: <Widget>[
                  const Center(
                      child: Text(
                    "Registro de Persona",
                    style: TextStyle(fontSize: 25, color: Colors.black54),
                  )),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingrese el nombre',
                        labelText: 'Nombre'),
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    controller: _txtNombre,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      objPersona.nombre = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingrese el apellido',
                        labelText: 'Apellido'),
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    controller: _txtApellido,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese el apellido';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      objPersona.apellido = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingrese la edad',
                        labelText: 'Edad'),
                    keyboardType: TextInputType.number,
                    controller: _txtEdad,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3)
                    ],
                    onSaved: (value) {
                      objPersona.edad = int.parse(value.toString()); //.toString();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showToast("Datos Correctos");
                          _personaBloc.personaSalarioAgregar.add(objPersona);
                          _formKey.currentState!.save();
                          print('Nombre: ${objPersona.nombre}');
                          print('ID: ${objPersona.id}');
                          print('Apellido: ${objPersona.apellido}');
                          print('Edad: ${objPersona.edad}');
                          _txtNombre.clear();
                          _txtApellido.clear();
                          _txtEdad.clear();
                        } else {
                          //showToast("Error, Ingrese los datos");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Error, Ingrese los datos')));
                        }
                      },
                      child: const Text('Registrar Persona'),
                        style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const PersonaPage()));
                      },
                      child: const Text('Listar Personas'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      )
                    ),
                  )
                ],
              ))),
    );
  }

  //void showToast(String msg, {int? duration, required int gravity}) {
  void showToast(String msg, {int? duration, int? gravity}) {
    //Toast.show(msg, context, duration: duration, gravity: gravity);
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}

class User {
  String name = "";
}
