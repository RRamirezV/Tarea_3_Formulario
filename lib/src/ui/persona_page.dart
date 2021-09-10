import '../blocs/persona_bloc.dart';
import '../models/persona.dart';
import 'package:flutter/material.dart';

class PersonaPage extends StatefulWidget {
  const PersonaPage({Key? key}) : super(key: key);

  @override
  _PersonaPageState createState() => _PersonaPageState();
}

class _PersonaPageState extends State<PersonaPage> {
  PersonaBloc _personaBloc = PersonaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Personas"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: StreamBuilder<List<Persona>>(
          stream: _personaBloc.personaListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Persona>> snapshot) {
            var personas = snapshot.data ?? [];
            return ListView.builder(
              itemCount: personas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(
                              Icons.people,
                              color: Colors.green,
                            ),
                          ),
                          title: Text(
                            personas[index].nombre+" "+personas[index].apellido,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text(
                            personas[index].edad.toString()+" años",
                            style: const TextStyle(fontSize: 14.0),
                          )
/*                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                  color: Colors.blue,
                                  icon: const Icon(Icons.thumb_up),
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalarioIncrement
                                        .add(empleados[index]);
                                    //print(empleados[index].nombre);
                                  }),
                              IconButton(
                                  color: Colors.red,
                                  icon: const Icon(Icons.thumb_down),
                                  onPressed: () {
                                    _empleadoBloc.empleadoSalarioDecrement
                                        .add(snapshot.data![index]);
                                    //_empleadoBloc.empleadoSalarioDecrement.add(snapshot.data![index]);
                                  }),
                            ],
                          ))  */
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
