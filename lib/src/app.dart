import 'package:tarea3/src/ui/persona_create.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyPersonaPageCreate(
          title: 'Personas',
        ),
      ),
    );
  }
}
